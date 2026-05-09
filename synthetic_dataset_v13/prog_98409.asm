; DESCRIPTION: Draws a white line from (125, 115) to (349, 82).
; PLAN: r0=125(x1), r1=115(y1), r2=349(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 115
LDI r2, 349
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
