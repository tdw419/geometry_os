; DESCRIPTION: Places a yellow line segment connecting (125, 239) to (10, 237).
; PLAN: r0=125(x1), r1=239(y1), r2=10(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 239
LDI r2, 10
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
