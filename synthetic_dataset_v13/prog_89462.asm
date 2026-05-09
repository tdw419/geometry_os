; DESCRIPTION: Renders a orange line between points (485, 228) and (221, 67).
; PLAN: r0=485(x1), r1=228(y1), r2=221(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 228
LDI r2, 221
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
