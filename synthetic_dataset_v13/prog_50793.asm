; DESCRIPTION: Renders a magenta line between points (211, 154) and (207, 12).
; PLAN: r0=211(x1), r1=154(y1), r2=207(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 154
LDI r2, 207
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
