; DESCRIPTION: Draws a white line from (349, 52) to (281, 7).
; PLAN: r0=349(x1), r1=52(y1), r2=281(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 52
LDI r2, 281
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
