; DESCRIPTION: Draws a blue line from (230, 182) to (332, 166).
; PLAN: r0=230(x1), r1=182(y1), r2=332(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 182
LDI r2, 332
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
