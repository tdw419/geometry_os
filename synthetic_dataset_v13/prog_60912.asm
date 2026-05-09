; DESCRIPTION: Renders a white line between points (192, 212) and (289, 146).
; PLAN: r0=192(x1), r1=212(y1), r2=289(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 212
LDI r2, 289
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
