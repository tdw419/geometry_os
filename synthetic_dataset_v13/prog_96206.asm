; DESCRIPTION: Draws a magenta line from (379, 125) to (150, 50).
; PLAN: r0=379(x1), r1=125(y1), r2=150(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 125
LDI r2, 150
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
