; DESCRIPTION: Renders a yellow line between points (365, 180) and (193, 89).
; PLAN: r0=365(x1), r1=180(y1), r2=193(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 180
LDI r2, 193
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
