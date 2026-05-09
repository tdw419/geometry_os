; DESCRIPTION: Draws a orange line from (151, 43) to (445, 29).
; PLAN: r0=151(x1), r1=43(y1), r2=445(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 43
LDI r2, 445
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
