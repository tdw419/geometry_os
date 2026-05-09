; DESCRIPTION: Places a cyan line segment connecting (29, 172) to (99, 168).
; PLAN: r0=29(x1), r1=172(y1), r2=99(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 172
LDI r2, 99
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
