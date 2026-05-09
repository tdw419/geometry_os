; DESCRIPTION: Renders a orange line between points (301, 243) and (277, 190).
; PLAN: r0=301(x1), r1=243(y1), r2=277(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 243
LDI r2, 277
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
