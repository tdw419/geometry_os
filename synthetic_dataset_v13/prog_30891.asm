; DESCRIPTION: Places a purple line segment connecting (197, 175) to (358, 213).
; PLAN: r0=197(x1), r1=175(y1), r2=358(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 175
LDI r2, 358
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
