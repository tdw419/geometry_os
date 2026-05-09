; DESCRIPTION: Composite: Renders a purple box of size 51x78 starting at (250, 1) then Places a magenta line segment connecting (172, 188) to (23, 114).
; PLAN: r0=250(x), r1=1(y), r2=51(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=188(y1), r7=23(x2), r8=114(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 1
LDI r2, 51
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 188
LDI r7, 23
LDI r8, 114
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
