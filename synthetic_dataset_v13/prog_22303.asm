; DESCRIPTION: Draws a white line from (299, 149) to (98, 229).
; PLAN: r0=299(x1), r1=149(y1), r2=98(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 149
LDI r2, 98
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
