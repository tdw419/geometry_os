; DESCRIPTION: Places a cyan line segment connecting (31, 51) to (148, 0).
; PLAN: r0=31(x1), r1=51(y1), r2=148(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 51
LDI r2, 148
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
