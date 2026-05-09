; DESCRIPTION: Draws a cyan line from (335, 166) to (335, 112).
; PLAN: r0=335(x1), r1=166(y1), r2=335(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 166
LDI r2, 335
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
