; DESCRIPTION: Renders a green line between points (10, 214) and (497, 161).
; PLAN: r0=10(x1), r1=214(y1), r2=497(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 214
LDI r2, 497
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
