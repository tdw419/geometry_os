; DESCRIPTION: Draws a white line from (159, 248) to (261, 244).
; PLAN: r0=159(x1), r1=248(y1), r2=261(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 248
LDI r2, 261
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
