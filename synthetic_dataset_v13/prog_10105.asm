; DESCRIPTION: Places a green line segment connecting (322, 73) to (405, 214).
; PLAN: r0=322(x1), r1=73(y1), r2=405(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 73
LDI r2, 405
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
