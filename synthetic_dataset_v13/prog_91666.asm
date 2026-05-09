; DESCRIPTION: Draws a yellow line from (393, 176) to (267, 246).
; PLAN: r0=393(x1), r1=176(y1), r2=267(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 176
LDI r2, 267
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
