; DESCRIPTION: Composite: Sets a single red pixel at (403, 94) then Draws a black rectangle at (179, 148) with width 68 and height 68.
; PLAN: r0=403(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=148(y), r7=68(width), r8=68(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 179
LDI r6, 148
LDI r7, 68
LDI r8, 68
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
