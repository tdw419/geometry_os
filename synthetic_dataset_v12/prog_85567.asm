; DESCRIPTION: Draws a black line from (325, 89) to (458, 42).
; PLAN: r0=325(x1), r1=89(y1), r2=458(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 89
LDI r2, 458
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
