; DESCRIPTION: Composite: Renders a white line between points (491, 166) and (289, 99) then Draws a red rectangle at (417, 105) with width 16 and height 25.
; PLAN: r0=491(x1), r1=166(y1), r2=289(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=105(y), r7=16(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 166
LDI r2, 289
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 105
LDI r7, 16
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
