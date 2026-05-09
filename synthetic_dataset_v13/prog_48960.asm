; DESCRIPTION: Draws a black line from (335, 183) to (193, 146).
; PLAN: r0=335(x1), r1=183(y1), r2=193(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 183
LDI r2, 193
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
