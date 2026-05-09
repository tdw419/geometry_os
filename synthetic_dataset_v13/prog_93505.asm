; DESCRIPTION: Places a cyan line segment connecting (387, 163) to (322, 44).
; PLAN: r0=387(x1), r1=163(y1), r2=322(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 163
LDI r2, 322
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
