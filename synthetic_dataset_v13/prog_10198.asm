; DESCRIPTION: Draws a magenta line from (63, 55) to (493, 253).
; PLAN: r0=63(x1), r1=55(y1), r2=493(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 55
LDI r2, 493
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
