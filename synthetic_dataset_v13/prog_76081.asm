; DESCRIPTION: Composite: Draws a magenta line from (369, 160) to (286, 118) then Places a red 117x102 rectangle at position (71, 26).
; PLAN: r0=369(x1), r1=160(y1), r2=286(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=26(y), r7=117(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 160
LDI r2, 286
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 26
LDI r7, 117
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
