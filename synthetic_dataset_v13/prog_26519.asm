; DESCRIPTION: Draws a magenta line from (482, 82) to (368, 15).
; PLAN: r0=482(x1), r1=82(y1), r2=368(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 82
LDI r2, 368
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
