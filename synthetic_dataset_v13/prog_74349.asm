; DESCRIPTION: Places a green line segment connecting (86, 223) to (196, 29).
; PLAN: r0=86(x1), r1=223(y1), r2=196(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 223
LDI r2, 196
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
