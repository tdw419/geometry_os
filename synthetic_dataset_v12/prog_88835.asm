; DESCRIPTION: Draws a magenta line from (92, 58) to (27, 25).
; PLAN: r0=92(x1), r1=58(y1), r2=27(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 58
LDI r2, 27
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
