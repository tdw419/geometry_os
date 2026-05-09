; DESCRIPTION: Draws a green line from (196, 80) to (114, 237).
; PLAN: r0=196(x1), r1=80(y1), r2=114(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 80
LDI r2, 114
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
