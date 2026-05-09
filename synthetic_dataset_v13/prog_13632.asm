; DESCRIPTION: Draws a green line from (366, 157) to (82, 165).
; PLAN: r0=366(x1), r1=157(y1), r2=82(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 157
LDI r2, 82
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
