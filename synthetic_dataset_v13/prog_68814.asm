; DESCRIPTION: Draws a red line from (267, 153) to (502, 183).
; PLAN: r0=267(x1), r1=153(y1), r2=502(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 153
LDI r2, 502
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
