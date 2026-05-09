; DESCRIPTION: Renders a orange line between points (270, 42) and (481, 125).
; PLAN: r0=270(x1), r1=42(y1), r2=481(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 42
LDI r2, 481
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
