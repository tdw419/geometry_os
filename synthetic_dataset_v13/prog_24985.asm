; DESCRIPTION: Places a cyan line segment connecting (59, 92) to (332, 65).
; PLAN: r0=59(x1), r1=92(y1), r2=332(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 92
LDI r2, 332
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
