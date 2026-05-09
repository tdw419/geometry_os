; DESCRIPTION: Draws a cyan line from (299, 85) to (461, 217).
; PLAN: r0=299(x1), r1=85(y1), r2=461(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 85
LDI r2, 461
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
