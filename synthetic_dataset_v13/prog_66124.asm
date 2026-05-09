; DESCRIPTION: Draws a yellow line from (338, 178) to (177, 55).
; PLAN: r0=338(x1), r1=178(y1), r2=177(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 178
LDI r2, 177
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
