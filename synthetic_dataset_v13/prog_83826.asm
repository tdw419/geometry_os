; DESCRIPTION: Renders a orange line between points (186, 53) and (187, 64).
; PLAN: r0=186(x1), r1=53(y1), r2=187(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 53
LDI r2, 187
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
