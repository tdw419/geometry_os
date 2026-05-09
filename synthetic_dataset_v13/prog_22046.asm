; DESCRIPTION: Draws a red line from (170, 73) to (399, 239).
; PLAN: r0=170(x1), r1=73(y1), r2=399(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 73
LDI r2, 399
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
