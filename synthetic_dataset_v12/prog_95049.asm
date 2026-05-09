; DESCRIPTION: Draws a green line from (371, 253) to (119, 255).
; PLAN: r0=371(x1), r1=253(y1), r2=119(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 253
LDI r2, 119
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
