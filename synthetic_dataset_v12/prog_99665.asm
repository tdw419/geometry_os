; DESCRIPTION: Places a cyan line segment connecting (323, 92) to (209, 40).
; PLAN: r0=323(x1), r1=92(y1), r2=209(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 92
LDI r2, 209
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
