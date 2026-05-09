; DESCRIPTION: Draws a green line from (116, 108) to (310, 53).
; PLAN: r0=116(x1), r1=108(y1), r2=310(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 108
LDI r2, 310
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
