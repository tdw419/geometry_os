; DESCRIPTION: Draws a blue line from (425, 45) to (27, 99).
; PLAN: r0=425(x1), r1=45(y1), r2=27(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 45
LDI r2, 27
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
