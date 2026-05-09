; DESCRIPTION: Draws a black line from (483, 32) to (128, 4).
; PLAN: r0=483(x1), r1=32(y1), r2=128(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 32
LDI r2, 128
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
