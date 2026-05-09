; DESCRIPTION: Places a yellow line segment connecting (248, 64) to (16, 223).
; PLAN: r0=248(x1), r1=64(y1), r2=16(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 64
LDI r2, 16
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
