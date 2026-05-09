; DESCRIPTION: Draws a green line from (194, 58) to (420, 43).
; PLAN: r0=194(x1), r1=58(y1), r2=420(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 58
LDI r2, 420
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
