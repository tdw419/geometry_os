; DESCRIPTION: Draws a red line from (249, 102) to (146, 57).
; PLAN: r0=249(x1), r1=102(y1), r2=146(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 102
LDI r2, 146
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
