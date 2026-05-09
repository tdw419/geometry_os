; DESCRIPTION: Draws a red line from (76, 6) to (386, 135).
; PLAN: r0=76(x1), r1=6(y1), r2=386(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 6
LDI r2, 386
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
