; DESCRIPTION: Renders a orange line between points (180, 20) and (400, 224).
; PLAN: r0=180(x1), r1=20(y1), r2=400(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 20
LDI r2, 400
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
