; DESCRIPTION: Renders a green line between points (322, 197) and (246, 45).
; PLAN: r0=322(x1), r1=197(y1), r2=246(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 197
LDI r2, 246
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
