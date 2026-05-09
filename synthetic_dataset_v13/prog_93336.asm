; DESCRIPTION: Draws a red line from (479, 90) to (283, 73).
; PLAN: r0=479(x1), r1=90(y1), r2=283(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 90
LDI r2, 283
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
