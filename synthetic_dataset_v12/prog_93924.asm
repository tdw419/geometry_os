; DESCRIPTION: Draws a white line from (157, 197) to (244, 58).
; PLAN: r0=157(x1), r1=197(y1), r2=244(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 197
LDI r2, 244
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
