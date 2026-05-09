; DESCRIPTION: Places a green line segment connecting (243, 151) to (13, 1).
; PLAN: r0=243(x1), r1=151(y1), r2=13(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 151
LDI r2, 13
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
