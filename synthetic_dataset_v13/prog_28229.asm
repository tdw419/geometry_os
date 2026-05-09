; DESCRIPTION: Draws a red line from (135, 107) to (102, 127).
; PLAN: r0=135(x1), r1=107(y1), r2=102(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 107
LDI r2, 102
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
