; DESCRIPTION: Renders a magenta line between points (59, 61) and (442, 30).
; PLAN: r0=59(x1), r1=61(y1), r2=442(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 61
LDI r2, 442
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
