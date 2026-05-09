; DESCRIPTION: Composite: Sets a single white pixel at (120, 76) then Creates a yellow rectangular region at (346, 25) spanning 39 by 115 pixels then Draws a magenta line from (411, 251) to (323, 125).
; PLAN: r0=120(x), r1=76(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=25(y), r7=39(width), r8=115(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x1), r11=251(y1), r12=323(x2), r13=125(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 76
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 25
LDI r7, 39
LDI r8, 115
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 251
LDI r12, 323
LDI r13, 125
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
