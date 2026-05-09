; DESCRIPTION: Renders a orange line between points (46, 120) and (92, 172).
; PLAN: r0=46(x1), r1=120(y1), r2=92(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 120
LDI r2, 92
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
