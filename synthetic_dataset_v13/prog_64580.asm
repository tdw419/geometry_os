; DESCRIPTION: Draws a black line from (128, 155) to (271, 143).
; PLAN: r0=128(x1), r1=155(y1), r2=271(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 155
LDI r2, 271
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
