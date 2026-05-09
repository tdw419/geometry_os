; DESCRIPTION: Draws a orange line from (237, 93) to (102, 193).
; PLAN: r0=237(x1), r1=93(y1), r2=102(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 93
LDI r2, 102
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
