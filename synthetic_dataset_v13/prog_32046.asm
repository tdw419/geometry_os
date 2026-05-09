; DESCRIPTION: Places a purple line segment connecting (197, 226) to (213, 177).
; PLAN: r0=197(x1), r1=226(y1), r2=213(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 226
LDI r2, 213
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
