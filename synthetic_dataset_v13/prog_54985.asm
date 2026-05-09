; DESCRIPTION: Draws a yellow line from (32, 187) to (429, 143).
; PLAN: r0=32(x1), r1=187(y1), r2=429(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 187
LDI r2, 429
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
