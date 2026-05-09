; DESCRIPTION: Places a yellow line segment connecting (48, 183) to (333, 250).
; PLAN: r0=48(x1), r1=183(y1), r2=333(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 183
LDI r2, 333
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
