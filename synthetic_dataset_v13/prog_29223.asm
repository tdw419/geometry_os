; DESCRIPTION: Places a yellow line segment connecting (223, 21) to (27, 199).
; PLAN: r0=223(x1), r1=21(y1), r2=27(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 21
LDI r2, 27
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
