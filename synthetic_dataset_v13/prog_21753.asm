; DESCRIPTION: Draws a green line from (90, 56) to (81, 255).
; PLAN: r0=90(x1), r1=56(y1), r2=81(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 56
LDI r2, 81
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
