; DESCRIPTION: Places a cyan line segment connecting (259, 67) to (137, 36).
; PLAN: r0=259(x1), r1=67(y1), r2=137(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 67
LDI r2, 137
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
