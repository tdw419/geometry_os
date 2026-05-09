; DESCRIPTION: Renders a blue line between points (131, 125) and (468, 215).
; PLAN: r0=131(x1), r1=125(y1), r2=468(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 125
LDI r2, 468
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
