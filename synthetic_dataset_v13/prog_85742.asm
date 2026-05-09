; DESCRIPTION: Renders a orange line between points (150, 205) and (179, 120).
; PLAN: r0=150(x1), r1=205(y1), r2=179(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 205
LDI r2, 179
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
