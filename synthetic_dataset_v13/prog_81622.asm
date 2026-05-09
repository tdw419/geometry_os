; DESCRIPTION: Places a yellow line segment connecting (243, 220) to (196, 140).
; PLAN: r0=243(x1), r1=220(y1), r2=196(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 220
LDI r2, 196
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
