; DESCRIPTION: Renders a cyan line between points (270, 140) and (177, 133).
; PLAN: r0=270(x1), r1=140(y1), r2=177(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 140
LDI r2, 177
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
