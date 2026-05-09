; DESCRIPTION: Draws a purple line from (510, 182) to (108, 208).
; PLAN: r0=510(x1), r1=182(y1), r2=108(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 182
LDI r2, 108
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
