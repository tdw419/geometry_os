; DESCRIPTION: Draws a orange line from (379, 107) to (307, 8).
; PLAN: r0=379(x1), r1=107(y1), r2=307(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 107
LDI r2, 307
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
