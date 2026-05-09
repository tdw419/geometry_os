; DESCRIPTION: Places a cyan line segment connecting (309, 158) to (60, 208).
; PLAN: r0=309(x1), r1=158(y1), r2=60(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 158
LDI r2, 60
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
