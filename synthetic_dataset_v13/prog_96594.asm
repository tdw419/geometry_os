; DESCRIPTION: Renders a orange line between points (357, 67) and (215, 167).
; PLAN: r0=357(x1), r1=67(y1), r2=215(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 67
LDI r2, 215
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
