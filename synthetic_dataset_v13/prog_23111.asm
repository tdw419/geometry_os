; DESCRIPTION: Composite: Draws a magenta line from (197, 103) to (337, 240) then Creates a red rectangular region at (281, 90) spanning 73 by 81 pixels.
; PLAN: r0=197(x1), r1=103(y1), r2=337(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=90(y), r7=73(width), r8=81(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 103
LDI r2, 337
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 90
LDI r7, 73
LDI r8, 81
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
