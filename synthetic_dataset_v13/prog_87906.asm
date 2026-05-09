; DESCRIPTION: Renders a cyan line between points (294, 64) and (199, 122).
; PLAN: r0=294(x1), r1=64(y1), r2=199(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 64
LDI r2, 199
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
