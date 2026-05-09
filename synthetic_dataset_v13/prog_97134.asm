; DESCRIPTION: Places a black line segment connecting (114, 164) to (231, 142).
; PLAN: r0=114(x1), r1=164(y1), r2=231(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 164
LDI r2, 231
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
