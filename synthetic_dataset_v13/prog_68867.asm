; DESCRIPTION: Places a cyan line segment connecting (175, 23) to (144, 191).
; PLAN: r0=175(x1), r1=23(y1), r2=144(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 23
LDI r2, 144
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
