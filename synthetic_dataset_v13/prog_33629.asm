; DESCRIPTION: Draws a orange line from (262, 225) to (190, 154).
; PLAN: r0=262(x1), r1=225(y1), r2=190(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 225
LDI r2, 190
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
