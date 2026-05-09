; DESCRIPTION: Places a purple line segment connecting (370, 214) to (459, 213).
; PLAN: r0=370(x1), r1=214(y1), r2=459(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 214
LDI r2, 459
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
