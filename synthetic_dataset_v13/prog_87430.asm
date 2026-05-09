; DESCRIPTION: Draws a purple line from (411, 159) to (202, 187).
; PLAN: r0=411(x1), r1=159(y1), r2=202(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 159
LDI r2, 202
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
