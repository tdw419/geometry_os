; DESCRIPTION: Draws a green line from (408, 86) to (121, 224).
; PLAN: r0=408(x1), r1=86(y1), r2=121(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 86
LDI r2, 121
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
