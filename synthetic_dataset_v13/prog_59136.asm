; DESCRIPTION: Renders a orange line between points (243, 173) and (99, 117).
; PLAN: r0=243(x1), r1=173(y1), r2=99(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 173
LDI r2, 99
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
