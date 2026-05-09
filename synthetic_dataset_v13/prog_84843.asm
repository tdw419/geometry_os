; DESCRIPTION: Renders a purple line between points (495, 160) and (391, 128).
; PLAN: r0=495(x1), r1=160(y1), r2=391(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 160
LDI r2, 391
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
