; DESCRIPTION: Draws a white line from (272, 248) to (462, 96).
; PLAN: r0=272(x1), r1=248(y1), r2=462(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 248
LDI r2, 462
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
