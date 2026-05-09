; DESCRIPTION: Draws a green line from (45, 85) to (292, 193).
; PLAN: r0=45(x1), r1=85(y1), r2=292(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 85
LDI r2, 292
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
