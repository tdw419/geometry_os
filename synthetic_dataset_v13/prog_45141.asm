; DESCRIPTION: Renders a green line between points (82, 199) and (322, 76).
; PLAN: r0=82(x1), r1=199(y1), r2=322(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 199
LDI r2, 322
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
