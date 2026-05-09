; DESCRIPTION: Renders a red line between points (12, 23) and (66, 64).
; PLAN: r0=12(x1), r1=23(y1), r2=66(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 23
LDI r2, 66
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
