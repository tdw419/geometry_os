; DESCRIPTION: Draws a orange line from (92, 197) to (28, 71).
; PLAN: r0=92(x1), r1=197(y1), r2=28(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 197
LDI r2, 28
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
