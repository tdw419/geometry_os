; DESCRIPTION: Renders a black line between points (305, 87) and (413, 179).
; PLAN: r0=305(x1), r1=87(y1), r2=413(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 87
LDI r2, 413
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
