; DESCRIPTION: Renders a orange line between points (196, 111) and (450, 67).
; PLAN: r0=196(x1), r1=111(y1), r2=450(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 111
LDI r2, 450
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
