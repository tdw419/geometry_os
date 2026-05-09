; DESCRIPTION: Renders a cyan line between points (297, 56) and (265, 143).
; PLAN: r0=297(x1), r1=56(y1), r2=265(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 56
LDI r2, 265
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
