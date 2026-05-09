; DESCRIPTION: Draws a yellow line from (197, 178) to (18, 180).
; PLAN: r0=197(x1), r1=178(y1), r2=18(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 178
LDI r2, 18
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
