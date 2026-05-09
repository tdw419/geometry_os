; DESCRIPTION: Draws a orange line from (425, 39) to (511, 57).
; PLAN: r0=425(x1), r1=39(y1), r2=511(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 39
LDI r2, 511
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
