; DESCRIPTION: Draws a black line from (156, 126) to (241, 153).
; PLAN: r0=156(x1), r1=126(y1), r2=241(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 126
LDI r2, 241
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
