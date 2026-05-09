; DESCRIPTION: Renders a cyan line between points (322, 161) and (297, 167).
; PLAN: r0=322(x1), r1=161(y1), r2=297(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 161
LDI r2, 297
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
