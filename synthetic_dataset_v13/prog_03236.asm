; DESCRIPTION: Places a yellow line segment connecting (101, 206) to (509, 192).
; PLAN: r0=101(x1), r1=206(y1), r2=509(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 206
LDI r2, 509
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
