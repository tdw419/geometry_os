; DESCRIPTION: Renders a cyan line between points (199, 105) and (225, 241).
; PLAN: r0=199(x1), r1=105(y1), r2=225(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 105
LDI r2, 225
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
