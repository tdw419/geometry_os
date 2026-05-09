; DESCRIPTION: Draws a cyan line from (222, 84) to (119, 206).
; PLAN: r0=222(x1), r1=84(y1), r2=119(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 84
LDI r2, 119
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
