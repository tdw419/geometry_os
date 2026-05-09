; DESCRIPTION: Places a yellow line segment connecting (238, 154) to (448, 125).
; PLAN: r0=238(x1), r1=154(y1), r2=448(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 154
LDI r2, 448
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
