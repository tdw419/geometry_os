; DESCRIPTION: Places a green line segment connecting (175, 25) to (196, 225).
; PLAN: r0=175(x1), r1=25(y1), r2=196(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 25
LDI r2, 196
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
