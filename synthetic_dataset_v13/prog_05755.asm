; DESCRIPTION: Renders a cyan line between points (289, 177) and (188, 44).
; PLAN: r0=289(x1), r1=177(y1), r2=188(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 177
LDI r2, 188
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
