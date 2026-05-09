; DESCRIPTION: Renders a red line between points (272, 117) and (199, 157).
; PLAN: r0=272(x1), r1=117(y1), r2=199(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 117
LDI r2, 199
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
