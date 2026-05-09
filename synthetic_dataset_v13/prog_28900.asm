; DESCRIPTION: Composite: Renders a green box of size 35x34 starting at (105, 181) then Places a purple line segment connecting (28, 162) to (321, 95).
; PLAN: r0=105(x), r1=181(y), r2=35(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x1), r6=162(y1), r7=321(x2), r8=95(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 181
LDI r2, 35
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 162
LDI r7, 321
LDI r8, 95
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
