; DESCRIPTION: Draws a green line from (125, 82) to (174, 233).
; PLAN: r0=125(x1), r1=82(y1), r2=174(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 82
LDI r2, 174
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
