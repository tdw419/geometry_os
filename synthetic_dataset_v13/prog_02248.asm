; DESCRIPTION: Renders a black line between points (82, 32) and (142, 95).
; PLAN: r0=82(x1), r1=32(y1), r2=142(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 32
LDI r2, 142
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
