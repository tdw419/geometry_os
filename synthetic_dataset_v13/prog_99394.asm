; DESCRIPTION: Composite: Draws a orange rectangle at (175, 15) with width 100 and height 115 then Places a purple line segment connecting (87, 242) to (240, 247).
; PLAN: r0=175(x), r1=15(y), r2=100(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=242(y1), r7=240(x2), r8=247(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 15
LDI r2, 100
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 242
LDI r7, 240
LDI r8, 247
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
