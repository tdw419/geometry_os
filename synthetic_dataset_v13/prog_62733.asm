; DESCRIPTION: Renders a orange line between points (154, 13) and (408, 33).
; PLAN: r0=154(x1), r1=13(y1), r2=408(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 13
LDI r2, 408
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
