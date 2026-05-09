; DESCRIPTION: Draws a blue line from (218, 253) to (207, 64).
; PLAN: r0=218(x1), r1=253(y1), r2=207(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 253
LDI r2, 207
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
