; DESCRIPTION: Renders a orange line between points (146, 57) and (23, 254).
; PLAN: r0=146(x1), r1=57(y1), r2=23(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 57
LDI r2, 23
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
