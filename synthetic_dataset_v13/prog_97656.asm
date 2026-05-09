; DESCRIPTION: Draws a red line from (2, 247) to (268, 146).
; PLAN: r0=2(x1), r1=247(y1), r2=268(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 247
LDI r2, 268
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
