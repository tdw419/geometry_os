; DESCRIPTION: Renders a black line between points (179, 206) and (150, 81).
; PLAN: r0=179(x1), r1=206(y1), r2=150(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 206
LDI r2, 150
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
