; DESCRIPTION: Places a black line segment connecting (101, 197) to (54, 8).
; PLAN: r0=101(x1), r1=197(y1), r2=54(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 197
LDI r2, 54
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
