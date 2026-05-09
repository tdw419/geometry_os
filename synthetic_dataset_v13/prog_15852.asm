; DESCRIPTION: Draws a cyan line from (248, 0) to (78, 104).
; PLAN: r0=248(x1), r1=0(y1), r2=78(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 0
LDI r2, 78
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
