; DESCRIPTION: Composite: Renders a purple line between points (386, 100) and (350, 202) then Renders a black box of size 49x79 starting at (9, 137).
; PLAN: r0=386(x1), r1=100(y1), r2=350(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=137(y), r7=49(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 100
LDI r2, 350
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 137
LDI r7, 49
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
