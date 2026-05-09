; DESCRIPTION: Renders a green line between points (157, 137) and (322, 242).
; PLAN: r0=157(x1), r1=137(y1), r2=322(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 137
LDI r2, 322
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
