; DESCRIPTION: Draws a purple line from (32, 173) to (8, 253).
; PLAN: r0=32(x1), r1=173(y1), r2=8(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 173
LDI r2, 8
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
