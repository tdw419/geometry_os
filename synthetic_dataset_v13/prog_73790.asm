; DESCRIPTION: Places a cyan line segment connecting (319, 220) to (339, 12).
; PLAN: r0=319(x1), r1=220(y1), r2=339(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 220
LDI r2, 339
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
