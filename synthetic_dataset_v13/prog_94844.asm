; DESCRIPTION: Draws a green line from (436, 237) to (127, 184).
; PLAN: r0=436(x1), r1=237(y1), r2=127(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 237
LDI r2, 127
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
