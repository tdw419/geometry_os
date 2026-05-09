; DESCRIPTION: Places a purple line segment connecting (346, 195) to (470, 99).
; PLAN: r0=346(x1), r1=195(y1), r2=470(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 195
LDI r2, 470
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
