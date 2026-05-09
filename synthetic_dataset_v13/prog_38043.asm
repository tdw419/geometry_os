; DESCRIPTION: Places a cyan line segment connecting (58, 48) to (375, 135).
; PLAN: r0=58(x1), r1=48(y1), r2=375(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 48
LDI r2, 375
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
