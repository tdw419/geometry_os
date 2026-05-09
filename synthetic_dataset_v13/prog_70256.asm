; DESCRIPTION: Places a yellow line segment connecting (215, 125) to (237, 149).
; PLAN: r0=215(x1), r1=125(y1), r2=237(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 125
LDI r2, 237
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
