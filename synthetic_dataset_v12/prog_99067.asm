; DESCRIPTION: Places a cyan line segment connecting (19, 238) to (226, 92).
; PLAN: r0=19(x1), r1=238(y1), r2=226(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 238
LDI r2, 226
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
