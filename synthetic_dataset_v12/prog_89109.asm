; DESCRIPTION: Places a cyan line segment connecting (322, 60) to (34, 16).
; PLAN: r0=322(x1), r1=60(y1), r2=34(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 60
LDI r2, 34
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
