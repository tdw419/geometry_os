; DESCRIPTION: Draws a blue line from (341, 128) to (509, 152).
; PLAN: r0=341(x1), r1=128(y1), r2=509(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 128
LDI r2, 509
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
