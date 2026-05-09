; DESCRIPTION: Draws a magenta line from (90, 253) to (117, 55).
; PLAN: r0=90(x1), r1=253(y1), r2=117(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 253
LDI r2, 117
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
