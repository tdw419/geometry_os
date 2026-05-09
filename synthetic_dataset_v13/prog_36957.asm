; DESCRIPTION: Places a cyan line segment connecting (258, 136) to (68, 208).
; PLAN: r0=258(x1), r1=136(y1), r2=68(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 136
LDI r2, 68
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
