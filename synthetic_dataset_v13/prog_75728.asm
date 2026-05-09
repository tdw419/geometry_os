; DESCRIPTION: Draws a black line from (64, 161) to (23, 128).
; PLAN: r0=64(x1), r1=161(y1), r2=23(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 161
LDI r2, 23
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
