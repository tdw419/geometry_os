; DESCRIPTION: Draws a green line from (92, 157) to (267, 41).
; PLAN: r0=92(x1), r1=157(y1), r2=267(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 157
LDI r2, 267
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
