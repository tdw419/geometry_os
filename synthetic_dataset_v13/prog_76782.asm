; DESCRIPTION: Places a purple line segment connecting (329, 154) to (329, 6).
; PLAN: r0=329(x1), r1=154(y1), r2=329(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 154
LDI r2, 329
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
