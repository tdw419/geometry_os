; DESCRIPTION: Draws a red line from (510, 68) to (296, 102).
; PLAN: r0=510(x1), r1=68(y1), r2=296(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 68
LDI r2, 296
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
