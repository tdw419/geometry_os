; DESCRIPTION: Renders a yellow line between points (263, 245) and (5, 61).
; PLAN: r0=263(x1), r1=245(y1), r2=5(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 245
LDI r2, 5
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
