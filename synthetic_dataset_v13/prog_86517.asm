; DESCRIPTION: Draws a green line from (104, 47) to (110, 110).
; PLAN: r0=104(x1), r1=47(y1), r2=110(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 47
LDI r2, 110
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
