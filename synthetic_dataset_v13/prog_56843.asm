; DESCRIPTION: Places a cyan line segment connecting (339, 31) to (260, 240).
; PLAN: r0=339(x1), r1=31(y1), r2=260(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 31
LDI r2, 260
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
