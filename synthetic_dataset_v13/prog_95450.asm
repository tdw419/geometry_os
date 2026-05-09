; DESCRIPTION: Draws a magenta line from (436, 128) to (456, 93).
; PLAN: r0=436(x1), r1=128(y1), r2=456(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 128
LDI r2, 456
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
