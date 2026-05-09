; DESCRIPTION: Draws a black line from (177, 53) to (341, 42).
; PLAN: r0=177(x1), r1=53(y1), r2=341(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 53
LDI r2, 341
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
