; DESCRIPTION: Renders a cyan line between points (357, 113) and (199, 212).
; PLAN: r0=357(x1), r1=113(y1), r2=199(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 113
LDI r2, 199
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
