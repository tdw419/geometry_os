; DESCRIPTION: Places a cyan line segment connecting (459, 119) to (162, 215).
; PLAN: r0=459(x1), r1=119(y1), r2=162(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 119
LDI r2, 162
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
