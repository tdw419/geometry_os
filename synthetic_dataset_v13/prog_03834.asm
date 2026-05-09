; DESCRIPTION: Draws a red line from (333, 167) to (360, 108).
; PLAN: r0=333(x1), r1=167(y1), r2=360(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 167
LDI r2, 360
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
