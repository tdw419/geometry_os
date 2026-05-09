; DESCRIPTION: Draws a cyan line from (322, 157) to (37, 70).
; PLAN: r0=322(x1), r1=157(y1), r2=37(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 157
LDI r2, 37
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
