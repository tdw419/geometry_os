; DESCRIPTION: Draws a white line from (75, 73) to (143, 161).
; PLAN: r0=75(x1), r1=73(y1), r2=143(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 73
LDI r2, 143
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
