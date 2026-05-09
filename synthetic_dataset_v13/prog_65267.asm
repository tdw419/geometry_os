; DESCRIPTION: Draws a white line from (85, 166) to (349, 146).
; PLAN: r0=85(x1), r1=166(y1), r2=349(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 166
LDI r2, 349
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
