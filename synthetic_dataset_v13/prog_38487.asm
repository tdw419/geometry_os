; DESCRIPTION: Renders a yellow line between points (351, 187) and (399, 42).
; PLAN: r0=351(x1), r1=187(y1), r2=399(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 187
LDI r2, 399
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
