; DESCRIPTION: Draws a white line from (125, 206) to (441, 33).
; PLAN: r0=125(x1), r1=206(y1), r2=441(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 206
LDI r2, 441
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
