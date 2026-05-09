; DESCRIPTION: Draws a yellow line from (236, 251) to (295, 197).
; PLAN: r0=236(x1), r1=251(y1), r2=295(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 251
LDI r2, 295
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
