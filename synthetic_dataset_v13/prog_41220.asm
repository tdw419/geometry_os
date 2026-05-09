; DESCRIPTION: Renders a magenta line between points (444, 210) and (218, 67).
; PLAN: r0=444(x1), r1=210(y1), r2=218(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 210
LDI r2, 218
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
