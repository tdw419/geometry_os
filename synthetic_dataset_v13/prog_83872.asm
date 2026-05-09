; DESCRIPTION: Renders a yellow line between points (234, 128) and (104, 151).
; PLAN: r0=234(x1), r1=128(y1), r2=104(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 128
LDI r2, 104
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
