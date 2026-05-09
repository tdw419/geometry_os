; DESCRIPTION: Renders a orange line between points (196, 146) and (164, 89).
; PLAN: r0=196(x1), r1=146(y1), r2=164(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 146
LDI r2, 164
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
