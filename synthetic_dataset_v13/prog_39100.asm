; DESCRIPTION: Draws a red line from (105, 177) to (117, 64).
; PLAN: r0=105(x1), r1=177(y1), r2=117(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 177
LDI r2, 117
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
