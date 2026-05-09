; DESCRIPTION: Draws a yellow line from (509, 197) to (228, 147).
; PLAN: r0=509(x1), r1=197(y1), r2=228(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 197
LDI r2, 228
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
