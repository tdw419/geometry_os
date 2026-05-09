; DESCRIPTION: Draws a purple line from (114, 226) to (479, 175).
; PLAN: r0=114(x1), r1=226(y1), r2=479(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 226
LDI r2, 479
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
