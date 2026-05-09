; DESCRIPTION: Draws a cyan line from (176, 189) to (483, 92).
; PLAN: r0=176(x1), r1=189(y1), r2=483(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 189
LDI r2, 483
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
