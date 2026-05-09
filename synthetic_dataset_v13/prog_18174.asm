; DESCRIPTION: Draws a white line from (509, 83) to (483, 127).
; PLAN: r0=509(x1), r1=83(y1), r2=483(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 83
LDI r2, 483
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
