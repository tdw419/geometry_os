; DESCRIPTION: Draws a magenta line from (368, 15) to (195, 55).
; PLAN: r0=368(x1), r1=15(y1), r2=195(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 15
LDI r2, 195
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
