; DESCRIPTION: Composite: Renders a magenta box of size 14x29 starting at (39, 6) then Places a black line segment connecting (421, 189) to (484, 110).
; PLAN: r0=39(x), r1=6(y), r2=14(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=189(y1), r7=484(x2), r8=110(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 6
LDI r2, 14
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 189
LDI r7, 484
LDI r8, 110
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
