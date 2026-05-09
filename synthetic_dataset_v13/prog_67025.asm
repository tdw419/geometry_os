; DESCRIPTION: Renders a orange line between points (169, 42) and (411, 224).
; PLAN: r0=169(x1), r1=42(y1), r2=411(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 42
LDI r2, 411
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
