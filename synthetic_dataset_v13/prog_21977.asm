; DESCRIPTION: Renders a cyan line between points (359, 227) and (199, 21).
; PLAN: r0=359(x1), r1=227(y1), r2=199(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 227
LDI r2, 199
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
