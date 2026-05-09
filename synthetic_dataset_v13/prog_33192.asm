; DESCRIPTION: Places a white line segment connecting (196, 243) to (138, 197).
; PLAN: r0=196(x1), r1=243(y1), r2=138(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 243
LDI r2, 138
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
