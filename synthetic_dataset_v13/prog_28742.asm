; DESCRIPTION: Draws a yellow line from (362, 134) to (437, 173).
; PLAN: r0=362(x1), r1=134(y1), r2=437(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 134
LDI r2, 437
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
