; DESCRIPTION: Draws a cyan line from (162, 64) to (331, 104).
; PLAN: r0=162(x1), r1=64(y1), r2=331(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 64
LDI r2, 331
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
