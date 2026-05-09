; DESCRIPTION: Draws a orange line from (294, 120) to (238, 130).
; PLAN: r0=294(x1), r1=120(y1), r2=238(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 120
LDI r2, 238
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
