; DESCRIPTION: Draws a blue line from (498, 32) to (114, 178).
; PLAN: r0=498(x1), r1=32(y1), r2=114(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 32
LDI r2, 114
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
