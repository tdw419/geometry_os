; DESCRIPTION: Places a green line segment connecting (448, 239) to (448, 96).
; PLAN: r0=448(x1), r1=239(y1), r2=448(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 239
LDI r2, 448
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
