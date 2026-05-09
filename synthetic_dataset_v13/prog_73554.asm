; DESCRIPTION: Draws a green line from (114, 176) to (371, 153).
; PLAN: r0=114(x1), r1=176(y1), r2=371(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 176
LDI r2, 371
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
