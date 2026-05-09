; DESCRIPTION: Renders a orange line between points (154, 63) and (237, 53).
; PLAN: r0=154(x1), r1=63(y1), r2=237(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 63
LDI r2, 237
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
