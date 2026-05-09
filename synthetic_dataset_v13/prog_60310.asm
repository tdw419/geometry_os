; DESCRIPTION: Draws a red line from (61, 209) to (287, 33).
; PLAN: r0=61(x1), r1=209(y1), r2=287(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 209
LDI r2, 287
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
