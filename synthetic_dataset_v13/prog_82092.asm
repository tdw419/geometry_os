; DESCRIPTION: Places a yellow line segment connecting (371, 193) to (394, 252).
; PLAN: r0=371(x1), r1=193(y1), r2=394(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 193
LDI r2, 394
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
