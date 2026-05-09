; DESCRIPTION: Renders a green line between points (256, 252) and (80, 222).
; PLAN: r0=256(x1), r1=252(y1), r2=80(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 252
LDI r2, 80
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
