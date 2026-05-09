; DESCRIPTION: Draws a orange line from (65, 190) to (445, 76).
; PLAN: r0=65(x1), r1=190(y1), r2=445(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 190
LDI r2, 445
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
