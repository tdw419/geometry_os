; DESCRIPTION: Draws a cyan line from (20, 104) to (418, 187).
; PLAN: r0=20(x1), r1=104(y1), r2=418(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 104
LDI r2, 418
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
