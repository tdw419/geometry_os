; DESCRIPTION: Draws a red line from (25, 28) to (499, 24).
; PLAN: r0=25(x1), r1=28(y1), r2=499(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 28
LDI r2, 499
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
