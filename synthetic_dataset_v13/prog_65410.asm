; DESCRIPTION: Renders a cyan line between points (322, 206) and (211, 172).
; PLAN: r0=322(x1), r1=206(y1), r2=211(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 206
LDI r2, 211
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
