; DESCRIPTION: Places a cyan line segment connecting (144, 8) to (33, 163).
; PLAN: r0=144(x1), r1=8(y1), r2=33(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 8
LDI r2, 33
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
