; DESCRIPTION: Renders a green line between points (322, 215) and (13, 126).
; PLAN: r0=322(x1), r1=215(y1), r2=13(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 215
LDI r2, 13
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
