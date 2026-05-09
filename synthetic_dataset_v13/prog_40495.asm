; DESCRIPTION: Draws a blue line from (242, 51) to (413, 102).
; PLAN: r0=242(x1), r1=51(y1), r2=413(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 51
LDI r2, 413
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
