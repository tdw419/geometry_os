; DESCRIPTION: Draws a yellow line from (135, 82) to (465, 177).
; PLAN: r0=135(x1), r1=82(y1), r2=465(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 82
LDI r2, 465
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
