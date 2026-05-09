; DESCRIPTION: Draws a black line from (267, 177) to (50, 209).
; PLAN: r0=267(x1), r1=177(y1), r2=50(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 177
LDI r2, 50
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
