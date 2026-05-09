; DESCRIPTION: Renders a orange line between points (445, 190) and (68, 221).
; PLAN: r0=445(x1), r1=190(y1), r2=68(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 190
LDI r2, 68
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
