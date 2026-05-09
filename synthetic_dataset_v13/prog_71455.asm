; DESCRIPTION: Draws a red line from (156, 158) to (277, 146).
; PLAN: r0=156(x1), r1=158(y1), r2=277(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 158
LDI r2, 277
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
