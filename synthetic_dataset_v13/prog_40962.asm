; DESCRIPTION: Composite: Draws a magenta line from (293, 227) to (362, 182) then Creates a yellow rectangular region at (252, 74) spanning 37 by 90 pixels.
; PLAN: r0=293(x1), r1=227(y1), r2=362(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=74(y), r7=37(width), r8=90(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 227
LDI r2, 362
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 74
LDI r7, 37
LDI r8, 90
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
