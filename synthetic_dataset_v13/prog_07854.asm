; DESCRIPTION: Places a cyan line segment connecting (59, 71) to (108, 35).
; PLAN: r0=59(x1), r1=71(y1), r2=108(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 71
LDI r2, 108
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
