; DESCRIPTION: Draws a white line from (307, 145) to (167, 92).
; PLAN: r0=307(x1), r1=145(y1), r2=167(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 145
LDI r2, 167
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
