; DESCRIPTION: Draws a cyan line from (9, 88) to (104, 232).
; PLAN: r0=9(x1), r1=88(y1), r2=104(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 88
LDI r2, 104
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
