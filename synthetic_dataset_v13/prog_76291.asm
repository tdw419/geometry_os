; DESCRIPTION: Draws a red line from (33, 39) to (481, 22).
; PLAN: r0=33(x1), r1=39(y1), r2=481(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 39
LDI r2, 481
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
