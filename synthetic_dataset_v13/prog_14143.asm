; DESCRIPTION: Renders a orange line between points (282, 237) and (70, 190).
; PLAN: r0=282(x1), r1=237(y1), r2=70(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 237
LDI r2, 70
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
