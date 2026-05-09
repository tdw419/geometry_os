; DESCRIPTION: Draws a black line from (25, 210) to (64, 234).
; PLAN: r0=25(x1), r1=210(y1), r2=64(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 210
LDI r2, 64
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
