; DESCRIPTION: Draws a blue line from (235, 61) to (388, 242).
; PLAN: r0=235(x1), r1=61(y1), r2=388(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 61
LDI r2, 388
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
