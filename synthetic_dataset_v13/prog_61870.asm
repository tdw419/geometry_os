; DESCRIPTION: Draws a white line from (425, 43) to (229, 244).
; PLAN: r0=425(x1), r1=43(y1), r2=229(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 43
LDI r2, 229
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
