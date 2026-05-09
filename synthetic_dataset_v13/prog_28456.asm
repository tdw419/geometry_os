; DESCRIPTION: Draws a orange line from (79, 111) to (279, 57).
; PLAN: r0=79(x1), r1=111(y1), r2=279(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 111
LDI r2, 279
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
