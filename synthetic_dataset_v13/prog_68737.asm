; DESCRIPTION: Renders a white line between points (105, 38) and (272, 39).
; PLAN: r0=105(x1), r1=38(y1), r2=272(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 38
LDI r2, 272
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
