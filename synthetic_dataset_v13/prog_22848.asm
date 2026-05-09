; DESCRIPTION: Renders a magenta line between points (258, 158) and (242, 67).
; PLAN: r0=258(x1), r1=158(y1), r2=242(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 158
LDI r2, 242
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
