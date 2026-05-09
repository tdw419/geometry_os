; DESCRIPTION: Draws a green line from (376, 248) to (123, 197).
; PLAN: r0=376(x1), r1=248(y1), r2=123(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 248
LDI r2, 123
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
