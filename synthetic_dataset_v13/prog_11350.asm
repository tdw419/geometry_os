; DESCRIPTION: Places a cyan line segment connecting (322, 117) to (82, 158).
; PLAN: r0=322(x1), r1=117(y1), r2=82(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 117
LDI r2, 82
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
