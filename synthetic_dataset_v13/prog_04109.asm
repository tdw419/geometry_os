; DESCRIPTION: Draws a black line from (467, 188) to (307, 255).
; PLAN: r0=467(x1), r1=188(y1), r2=307(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 188
LDI r2, 307
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
