; DESCRIPTION: Draws a green line from (505, 226) to (501, 254).
; PLAN: r0=505(x1), r1=226(y1), r2=501(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 226
LDI r2, 501
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
