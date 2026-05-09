; DESCRIPTION: Draws a purple line from (352, 114) to (98, 134).
; PLAN: r0=352(x1), r1=114(y1), r2=98(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 114
LDI r2, 98
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
