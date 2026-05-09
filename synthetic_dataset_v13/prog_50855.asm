; DESCRIPTION: Draws a black line from (258, 64) to (32, 34).
; PLAN: r0=258(x1), r1=64(y1), r2=32(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 64
LDI r2, 32
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
