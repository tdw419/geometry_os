; DESCRIPTION: Renders a black line between points (325, 73) and (388, 42).
; PLAN: r0=325(x1), r1=73(y1), r2=388(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 73
LDI r2, 388
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
