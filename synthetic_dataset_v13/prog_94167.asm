; DESCRIPTION: Draws a purple line from (197, 96) to (352, 94).
; PLAN: r0=197(x1), r1=96(y1), r2=352(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 96
LDI r2, 352
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
