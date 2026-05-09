; DESCRIPTION: Draws a green line from (78, 104) to (115, 209).
; PLAN: r0=78(x1), r1=104(y1), r2=115(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 104
LDI r2, 115
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
