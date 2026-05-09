; DESCRIPTION: Renders a orange line between points (154, 11) and (124, 164).
; PLAN: r0=154(x1), r1=11(y1), r2=124(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 11
LDI r2, 124
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
