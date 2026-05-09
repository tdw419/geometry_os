; DESCRIPTION: Renders a magenta line between points (258, 228) and (473, 201).
; PLAN: r0=258(x1), r1=228(y1), r2=473(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 228
LDI r2, 473
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
