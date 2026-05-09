; DESCRIPTION: Renders a white line between points (21, 52) and (145, 42).
; PLAN: r0=21(x1), r1=52(y1), r2=145(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 52
LDI r2, 145
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
