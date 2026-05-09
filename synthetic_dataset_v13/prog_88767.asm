; DESCRIPTION: Places a cyan line segment connecting (504, 149) to (454, 163).
; PLAN: r0=504(x1), r1=149(y1), r2=454(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 149
LDI r2, 454
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
