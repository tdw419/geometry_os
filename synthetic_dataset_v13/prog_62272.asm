; DESCRIPTION: Draws a black line from (198, 198) to (449, 128).
; PLAN: r0=198(x1), r1=198(y1), r2=449(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 198
LDI r2, 449
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
