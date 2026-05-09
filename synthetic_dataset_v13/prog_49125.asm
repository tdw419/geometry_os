; DESCRIPTION: Renders a black line between points (102, 42) and (387, 179).
; PLAN: r0=102(x1), r1=42(y1), r2=387(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 42
LDI r2, 387
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
