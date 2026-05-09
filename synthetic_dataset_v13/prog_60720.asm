; DESCRIPTION: Draws a black line from (128, 39) to (21, 4).
; PLAN: r0=128(x1), r1=39(y1), r2=21(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 39
LDI r2, 21
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
