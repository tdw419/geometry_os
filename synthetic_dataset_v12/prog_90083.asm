; DESCRIPTION: Renders a orange line between points (268, 30) and (70, 152).
; PLAN: r0=268(x1), r1=30(y1), r2=70(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 30
LDI r2, 70
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
