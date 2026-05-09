; DESCRIPTION: Renders a orange line between points (42, 210) and (268, 45).
; PLAN: r0=42(x1), r1=210(y1), r2=268(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 210
LDI r2, 268
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
