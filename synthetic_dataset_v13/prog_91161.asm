; DESCRIPTION: Draws a magenta line from (433, 79) to (382, 103).
; PLAN: r0=433(x1), r1=79(y1), r2=382(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 79
LDI r2, 382
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
