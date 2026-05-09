; DESCRIPTION: Draws a green line from (60, 55) to (483, 152).
; PLAN: r0=60(x1), r1=55(y1), r2=483(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 55
LDI r2, 483
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
