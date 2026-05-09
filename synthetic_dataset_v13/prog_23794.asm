; DESCRIPTION: Renders a black line between points (61, 87) and (166, 196).
; PLAN: r0=61(x1), r1=87(y1), r2=166(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 87
LDI r2, 166
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
