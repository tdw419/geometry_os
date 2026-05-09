; DESCRIPTION: Renders a magenta line between points (224, 31) and (160, 194).
; PLAN: r0=224(x1), r1=31(y1), r2=160(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 31
LDI r2, 160
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
