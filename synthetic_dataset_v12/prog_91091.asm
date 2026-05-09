; DESCRIPTION: Renders a black line between points (6, 153) and (126, 42).
; PLAN: r0=6(x1), r1=153(y1), r2=126(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 153
LDI r2, 126
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
