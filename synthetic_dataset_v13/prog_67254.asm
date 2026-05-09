; DESCRIPTION: Draws a blue line from (376, 117) to (202, 236).
; PLAN: r0=376(x1), r1=117(y1), r2=202(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 117
LDI r2, 202
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
