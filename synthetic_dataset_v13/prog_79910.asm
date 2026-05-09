; DESCRIPTION: Renders a magenta line between points (0, 67) and (475, 50).
; PLAN: r0=0(x1), r1=67(y1), r2=475(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 67
LDI r2, 475
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
