; DESCRIPTION: Renders a orange line between points (164, 32) and (437, 0).
; PLAN: r0=164(x1), r1=32(y1), r2=437(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 32
LDI r2, 437
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
