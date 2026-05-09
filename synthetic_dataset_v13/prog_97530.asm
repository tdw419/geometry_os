; DESCRIPTION: Draws a orange line from (65, 36) to (509, 134).
; PLAN: r0=65(x1), r1=36(y1), r2=509(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 36
LDI r2, 509
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
