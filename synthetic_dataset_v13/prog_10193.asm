; DESCRIPTION: Renders a black line between points (42, 144) and (272, 179).
; PLAN: r0=42(x1), r1=144(y1), r2=272(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 144
LDI r2, 272
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
