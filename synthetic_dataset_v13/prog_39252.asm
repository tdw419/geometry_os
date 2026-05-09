; DESCRIPTION: Renders a orange line between points (152, 24) and (330, 128).
; PLAN: r0=152(x1), r1=24(y1), r2=330(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 24
LDI r2, 330
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
