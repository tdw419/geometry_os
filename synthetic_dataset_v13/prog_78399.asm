; DESCRIPTION: Renders a white line between points (272, 38) and (73, 96).
; PLAN: r0=272(x1), r1=38(y1), r2=73(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 38
LDI r2, 73
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
