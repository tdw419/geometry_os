; DESCRIPTION: Places a yellow line segment connecting (402, 255) to (237, 146).
; PLAN: r0=402(x1), r1=255(y1), r2=237(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 255
LDI r2, 237
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
