; DESCRIPTION: Places a cyan line segment connecting (353, 168) to (117, 89).
; PLAN: r0=353(x1), r1=168(y1), r2=117(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 168
LDI r2, 117
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
