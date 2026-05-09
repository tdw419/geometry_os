; DESCRIPTION: Draws a white line from (163, 63) to (263, 65).
; PLAN: r0=163(x1), r1=63(y1), r2=263(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 63
LDI r2, 263
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
