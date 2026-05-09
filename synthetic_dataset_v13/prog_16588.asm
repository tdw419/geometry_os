; DESCRIPTION: Renders a yellow line between points (272, 32) and (412, 192).
; PLAN: r0=272(x1), r1=32(y1), r2=412(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 32
LDI r2, 412
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
