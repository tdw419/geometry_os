; DESCRIPTION: Renders a orange line between points (52, 76) and (42, 243).
; PLAN: r0=52(x1), r1=76(y1), r2=42(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 76
LDI r2, 42
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
