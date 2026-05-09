; DESCRIPTION: Draws a black line from (259, 172) to (267, 33).
; PLAN: r0=259(x1), r1=172(y1), r2=267(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 172
LDI r2, 267
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
