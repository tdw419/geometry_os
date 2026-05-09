; DESCRIPTION: Draws a cyan line from (110, 222) to (67, 9).
; PLAN: r0=110(x1), r1=222(y1), r2=67(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 222
LDI r2, 67
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
