; DESCRIPTION: Draws a orange line from (180, 55) to (511, 202).
; PLAN: r0=180(x1), r1=55(y1), r2=511(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 55
LDI r2, 511
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
