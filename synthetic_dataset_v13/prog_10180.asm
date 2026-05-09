; DESCRIPTION: Draws a white line from (272, 25) to (395, 31).
; PLAN: r0=272(x1), r1=25(y1), r2=395(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 25
LDI r2, 395
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
