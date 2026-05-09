; DESCRIPTION: Renders a orange line between points (366, 146) and (433, 187).
; PLAN: r0=366(x1), r1=146(y1), r2=433(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 146
LDI r2, 433
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
