; DESCRIPTION: Places a cyan line segment connecting (371, 34) to (108, 61).
; PLAN: r0=371(x1), r1=34(y1), r2=108(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 34
LDI r2, 108
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
