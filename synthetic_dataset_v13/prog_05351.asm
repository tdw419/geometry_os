; DESCRIPTION: Draws a red line from (43, 143) to (39, 91).
; PLAN: r0=43(x1), r1=143(y1), r2=39(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 143
LDI r2, 39
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
