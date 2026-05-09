; DESCRIPTION: Draws a magenta line from (103, 242) to (497, 253).
; PLAN: r0=103(x1), r1=242(y1), r2=497(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 242
LDI r2, 497
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
