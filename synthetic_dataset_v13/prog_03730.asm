; DESCRIPTION: Draws a yellow line from (376, 152) to (282, 231).
; PLAN: r0=376(x1), r1=152(y1), r2=282(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 152
LDI r2, 282
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
