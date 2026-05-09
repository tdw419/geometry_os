; DESCRIPTION: Draws a orange line from (102, 55) to (242, 23).
; PLAN: r0=102(x1), r1=55(y1), r2=242(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 55
LDI r2, 242
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
