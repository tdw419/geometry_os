; DESCRIPTION: Places a blue line segment connecting (242, 218) to (292, 128).
; PLAN: r0=242(x1), r1=218(y1), r2=292(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 218
LDI r2, 292
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
