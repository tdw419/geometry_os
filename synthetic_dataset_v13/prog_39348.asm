; DESCRIPTION: Places a yellow line segment connecting (325, 142) to (215, 65).
; PLAN: r0=325(x1), r1=142(y1), r2=215(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 142
LDI r2, 215
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
