; DESCRIPTION: Draws a green line from (260, 187) to (344, 21).
; PLAN: r0=260(x1), r1=187(y1), r2=344(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 187
LDI r2, 344
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
