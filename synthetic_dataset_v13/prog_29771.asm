; DESCRIPTION: Draws a green line from (511, 137) to (42, 147).
; PLAN: r0=511(x1), r1=137(y1), r2=42(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 137
LDI r2, 42
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
