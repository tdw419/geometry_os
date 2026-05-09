; DESCRIPTION: Composite: Sets a single black pixel at (60, 38) then Draws a orange rectangle at (169, 163) with width 117 and height 47.
; PLAN: r0=60(x), r1=38(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=163(y), r7=117(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 38
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 169
LDI r6, 163
LDI r7, 117
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
