; DESCRIPTION: Places a yellow line segment connecting (180, 64) to (248, 128).
; PLAN: r0=180(x1), r1=64(y1), r2=248(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 64
LDI r2, 248
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
