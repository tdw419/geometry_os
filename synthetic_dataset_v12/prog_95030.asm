; DESCRIPTION: Renders a cyan line between points (307, 218) and (199, 188).
; PLAN: r0=307(x1), r1=218(y1), r2=199(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 218
LDI r2, 199
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
