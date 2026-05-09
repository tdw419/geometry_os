; DESCRIPTION: Draws a yellow line from (286, 26) to (415, 29).
; PLAN: r0=286(x1), r1=26(y1), r2=415(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 26
LDI r2, 415
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
