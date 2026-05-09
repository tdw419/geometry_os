; DESCRIPTION: Places a yellow line segment connecting (17, 77) to (215, 63).
; PLAN: r0=17(x1), r1=77(y1), r2=215(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 77
LDI r2, 215
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
