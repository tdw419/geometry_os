; DESCRIPTION: Renders a orange line between points (35, 215) and (160, 12).
; PLAN: r0=35(x1), r1=215(y1), r2=160(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 215
LDI r2, 160
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
