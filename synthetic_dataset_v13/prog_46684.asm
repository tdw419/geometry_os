; DESCRIPTION: Places a cyan line segment connecting (382, 207) to (322, 115).
; PLAN: r0=382(x1), r1=207(y1), r2=322(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 207
LDI r2, 322
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
