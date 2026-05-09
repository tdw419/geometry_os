; DESCRIPTION: Places a cyan line segment connecting (123, 104) to (231, 164).
; PLAN: r0=123(x1), r1=104(y1), r2=231(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 104
LDI r2, 231
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
