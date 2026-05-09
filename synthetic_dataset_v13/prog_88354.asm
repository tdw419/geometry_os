; DESCRIPTION: Renders a magenta line between points (166, 85) and (154, 160).
; PLAN: r0=166(x1), r1=85(y1), r2=154(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 85
LDI r2, 154
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
