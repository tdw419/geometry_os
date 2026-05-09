; DESCRIPTION: Renders a red line between points (32, 237) and (79, 191).
; PLAN: r0=32(x1), r1=237(y1), r2=79(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 237
LDI r2, 79
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
