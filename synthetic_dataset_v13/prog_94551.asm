; DESCRIPTION: Draws a yellow line from (417, 103) to (344, 207).
; PLAN: r0=417(x1), r1=103(y1), r2=344(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 103
LDI r2, 344
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
