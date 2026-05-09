; DESCRIPTION: Places a yellow line segment connecting (502, 250) to (28, 26).
; PLAN: r0=502(x1), r1=250(y1), r2=28(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 250
LDI r2, 28
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
