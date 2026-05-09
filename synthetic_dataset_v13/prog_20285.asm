; DESCRIPTION: Places a purple line segment connecting (40, 238) to (236, 213).
; PLAN: r0=40(x1), r1=238(y1), r2=236(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 238
LDI r2, 236
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
