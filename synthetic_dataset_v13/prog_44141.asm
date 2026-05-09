; DESCRIPTION: Draws a black line from (384, 58) to (473, 1).
; PLAN: r0=384(x1), r1=58(y1), r2=473(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 58
LDI r2, 473
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
