; DESCRIPTION: Draws a red line from (39, 6) to (264, 29).
; PLAN: r0=39(x1), r1=6(y1), r2=264(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 6
LDI r2, 264
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
