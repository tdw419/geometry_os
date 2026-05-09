; DESCRIPTION: Places a cyan line segment connecting (291, 101) to (447, 231).
; PLAN: r0=291(x1), r1=101(y1), r2=447(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 101
LDI r2, 447
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
