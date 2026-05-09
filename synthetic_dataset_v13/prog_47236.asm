; DESCRIPTION: Composite: Sets a single red pixel at (206, 36) then Draws a yellow rectangle at (310, 142) with width 72 and height 98.
; PLAN: r0=206(x), r1=36(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=142(y), r7=72(width), r8=98(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 36
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 310
LDI r6, 142
LDI r7, 72
LDI r8, 98
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
