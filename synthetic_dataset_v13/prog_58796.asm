; DESCRIPTION: Renders a black line between points (261, 67) and (510, 212).
; PLAN: r0=261(x1), r1=67(y1), r2=510(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 67
LDI r2, 510
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
