; DESCRIPTION: Draws a orange line from (368, 28) to (279, 108).
; PLAN: r0=368(x1), r1=28(y1), r2=279(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 28
LDI r2, 279
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
