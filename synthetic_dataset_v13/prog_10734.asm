; DESCRIPTION: Renders a magenta line between points (83, 172) and (42, 224).
; PLAN: r0=83(x1), r1=172(y1), r2=42(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 172
LDI r2, 42
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
