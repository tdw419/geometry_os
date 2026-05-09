; DESCRIPTION: Renders a yellow line between points (46, 67) and (467, 123).
; PLAN: r0=46(x1), r1=67(y1), r2=467(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 67
LDI r2, 467
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
