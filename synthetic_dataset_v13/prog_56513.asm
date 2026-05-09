; DESCRIPTION: Renders a orange line between points (74, 53) and (213, 67).
; PLAN: r0=74(x1), r1=53(y1), r2=213(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 53
LDI r2, 213
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
