; DESCRIPTION: Places a cyan line segment connecting (349, 99) to (349, 71).
; PLAN: r0=349(x1), r1=99(y1), r2=349(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 99
LDI r2, 349
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
