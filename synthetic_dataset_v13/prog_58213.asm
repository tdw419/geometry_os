; DESCRIPTION: Draws a red line from (302, 228) to (463, 176).
; PLAN: r0=302(x1), r1=228(y1), r2=463(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 228
LDI r2, 463
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
