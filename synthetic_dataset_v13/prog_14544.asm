; DESCRIPTION: Draws a red line from (184, 135) to (233, 209).
; PLAN: r0=184(x1), r1=135(y1), r2=233(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 135
LDI r2, 233
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
