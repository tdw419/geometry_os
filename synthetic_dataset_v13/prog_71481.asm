; DESCRIPTION: Draws a orange line from (425, 65) to (481, 225).
; PLAN: r0=425(x1), r1=65(y1), r2=481(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 65
LDI r2, 481
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
