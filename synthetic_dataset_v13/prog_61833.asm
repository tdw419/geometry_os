; DESCRIPTION: Renders a yellow line between points (262, 125) and (366, 164).
; PLAN: r0=262(x1), r1=125(y1), r2=366(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 125
LDI r2, 366
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
