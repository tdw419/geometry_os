; DESCRIPTION: Places a purple line segment connecting (246, 197) to (180, 202).
; PLAN: r0=246(x1), r1=197(y1), r2=180(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 197
LDI r2, 180
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
