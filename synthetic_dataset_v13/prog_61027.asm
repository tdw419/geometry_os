; DESCRIPTION: Renders a orange line between points (154, 182) and (214, 59).
; PLAN: r0=154(x1), r1=182(y1), r2=214(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 182
LDI r2, 214
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
