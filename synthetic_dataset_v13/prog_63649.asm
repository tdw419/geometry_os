; DESCRIPTION: Draws a cyan line from (454, 3) to (163, 181).
; PLAN: r0=454(x1), r1=3(y1), r2=163(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 3
LDI r2, 163
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
