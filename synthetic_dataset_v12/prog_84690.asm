; DESCRIPTION: Draws a white line from (384, 185) to (267, 62).
; PLAN: r0=384(x1), r1=185(y1), r2=267(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 185
LDI r2, 267
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
