; DESCRIPTION: Draws a cyan line from (484, 175) to (390, 146).
; PLAN: r0=484(x1), r1=175(y1), r2=390(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 175
LDI r2, 390
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
