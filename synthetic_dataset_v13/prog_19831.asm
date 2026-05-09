; DESCRIPTION: Places a green line segment connecting (410, 28) to (258, 208).
; PLAN: r0=410(x1), r1=28(y1), r2=258(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 28
LDI r2, 258
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
