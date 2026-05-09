; DESCRIPTION: Draws a cyan line from (276, 147) to (137, 154).
; PLAN: r0=276(x1), r1=147(y1), r2=137(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 147
LDI r2, 137
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
