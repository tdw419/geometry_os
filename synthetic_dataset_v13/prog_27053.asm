; DESCRIPTION: Draws a cyan line from (505, 94) to (84, 155).
; PLAN: r0=505(x1), r1=94(y1), r2=84(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 94
LDI r2, 84
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
