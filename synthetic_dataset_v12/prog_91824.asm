; DESCRIPTION: Draws a green line from (158, 249) to (344, 49).
; PLAN: r0=158(x1), r1=249(y1), r2=344(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 249
LDI r2, 344
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
