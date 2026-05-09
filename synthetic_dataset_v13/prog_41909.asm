; DESCRIPTION: Renders a green line between points (140, 40) and (322, 103).
; PLAN: r0=140(x1), r1=40(y1), r2=322(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 40
LDI r2, 322
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
