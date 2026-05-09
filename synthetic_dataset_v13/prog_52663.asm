; DESCRIPTION: Places a cyan line segment connecting (76, 168) to (383, 161).
; PLAN: r0=76(x1), r1=168(y1), r2=383(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 168
LDI r2, 383
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
