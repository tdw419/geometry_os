; DESCRIPTION: Renders a green line between points (199, 236) and (32, 21).
; PLAN: r0=199(x1), r1=236(y1), r2=32(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 236
LDI r2, 32
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
