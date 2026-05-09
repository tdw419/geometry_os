; DESCRIPTION: Draws a black line from (7, 64) to (18, 32).
; PLAN: r0=7(x1), r1=64(y1), r2=18(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 64
LDI r2, 18
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
