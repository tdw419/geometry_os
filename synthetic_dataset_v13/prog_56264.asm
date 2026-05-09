; DESCRIPTION: Draws a black line from (144, 206) to (412, 247).
; PLAN: r0=144(x1), r1=206(y1), r2=412(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 206
LDI r2, 412
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
