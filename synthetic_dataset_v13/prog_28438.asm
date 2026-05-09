; DESCRIPTION: Draws a white line from (434, 2) to (444, 17).
; PLAN: r0=434(x1), r1=2(y1), r2=444(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 2
LDI r2, 444
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
