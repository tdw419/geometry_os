; DESCRIPTION: Renders a orange line between points (442, 45) and (263, 117).
; PLAN: r0=442(x1), r1=45(y1), r2=263(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 45
LDI r2, 263
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
