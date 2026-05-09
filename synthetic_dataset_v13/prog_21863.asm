; DESCRIPTION: Draws a white line from (272, 8) to (270, 148).
; PLAN: r0=272(x1), r1=8(y1), r2=270(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 8
LDI r2, 270
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
