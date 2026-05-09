; DESCRIPTION: Renders a cyan line between points (501, 241) and (322, 166).
; PLAN: r0=501(x1), r1=241(y1), r2=322(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 241
LDI r2, 322
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
