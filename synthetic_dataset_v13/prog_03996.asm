; DESCRIPTION: Draws a red line from (166, 23) to (219, 127).
; PLAN: r0=166(x1), r1=23(y1), r2=219(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 23
LDI r2, 219
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
