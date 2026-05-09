; DESCRIPTION: Renders a magenta line between points (46, 59) and (376, 114).
; PLAN: r0=46(x1), r1=59(y1), r2=376(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 59
LDI r2, 376
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
