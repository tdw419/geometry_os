; DESCRIPTION: Places a cyan line segment connecting (322, 16) to (20, 35).
; PLAN: r0=322(x1), r1=16(y1), r2=20(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 16
LDI r2, 20
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
