; DESCRIPTION: Places a cyan line segment connecting (58, 238) to (449, 33).
; PLAN: r0=58(x1), r1=238(y1), r2=449(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 238
LDI r2, 449
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
