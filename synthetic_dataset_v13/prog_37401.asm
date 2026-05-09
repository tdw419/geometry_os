; DESCRIPTION: Draws a magenta line from (382, 150) to (198, 73).
; PLAN: r0=382(x1), r1=150(y1), r2=198(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 150
LDI r2, 198
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
