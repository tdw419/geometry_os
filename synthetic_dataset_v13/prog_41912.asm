; DESCRIPTION: Draws a red line from (206, 51) to (108, 209).
; PLAN: r0=206(x1), r1=51(y1), r2=108(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 51
LDI r2, 108
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
