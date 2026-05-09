; DESCRIPTION: Places a green line segment connecting (160, 0) to (270, 165).
; PLAN: r0=160(x1), r1=0(y1), r2=270(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 0
LDI r2, 270
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
