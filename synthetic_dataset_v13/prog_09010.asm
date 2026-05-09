; DESCRIPTION: Places a yellow line segment connecting (35, 128) to (141, 192).
; PLAN: r0=35(x1), r1=128(y1), r2=141(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 128
LDI r2, 141
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
