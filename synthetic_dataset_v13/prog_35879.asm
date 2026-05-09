; DESCRIPTION: Draws a yellow line from (497, 48) to (384, 39).
; PLAN: r0=497(x1), r1=48(y1), r2=384(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 48
LDI r2, 384
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
