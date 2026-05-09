; DESCRIPTION: Renders a black line between points (457, 154) and (57, 47).
; PLAN: r0=457(x1), r1=154(y1), r2=57(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 154
LDI r2, 57
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
