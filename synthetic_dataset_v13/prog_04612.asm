; DESCRIPTION: Draws a green line from (362, 136) to (86, 226).
; PLAN: r0=362(x1), r1=136(y1), r2=86(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 136
LDI r2, 86
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
