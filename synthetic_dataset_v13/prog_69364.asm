; DESCRIPTION: Places a cyan line segment connecting (280, 140) to (117, 176).
; PLAN: r0=280(x1), r1=140(y1), r2=117(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 140
LDI r2, 117
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
