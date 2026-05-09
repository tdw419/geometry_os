; DESCRIPTION: Renders a orange line between points (387, 78) and (191, 231).
; PLAN: r0=387(x1), r1=78(y1), r2=191(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 78
LDI r2, 191
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
