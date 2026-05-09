; DESCRIPTION: Draws a green line from (336, 225) to (344, 215).
; PLAN: r0=336(x1), r1=225(y1), r2=344(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 225
LDI r2, 344
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
