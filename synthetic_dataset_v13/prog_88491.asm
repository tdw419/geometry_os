; DESCRIPTION: Draws a orange line from (480, 143) to (481, 140).
; PLAN: r0=480(x1), r1=143(y1), r2=481(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 143
LDI r2, 481
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
