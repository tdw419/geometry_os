; DESCRIPTION: Places a cyan line segment connecting (383, 168) to (268, 40).
; PLAN: r0=383(x1), r1=168(y1), r2=268(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 168
LDI r2, 268
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
