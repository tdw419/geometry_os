; DESCRIPTION: Draws a red line from (395, 233) to (68, 228).
; PLAN: r0=395(x1), r1=233(y1), r2=68(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 233
LDI r2, 68
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
