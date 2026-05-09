; DESCRIPTION: Renders a purple line between points (301, 202) and (306, 221).
; PLAN: r0=301(x1), r1=202(y1), r2=306(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 202
LDI r2, 306
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
