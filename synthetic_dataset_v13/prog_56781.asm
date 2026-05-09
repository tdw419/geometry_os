; DESCRIPTION: Composite: Creates a magenta rectangular region at (172, 22) spanning 102 by 103 pixels then Sets a single red pixel at (266, 30) then Renders a white line between points (480, 197) and (368, 52).
; PLAN: r0=172(x), r1=22(y), r2=102(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=30(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=480(x1), r11=197(y1), r12=368(x2), r13=52(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 22
LDI r2, 102
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 30
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 480
LDI r11, 197
LDI r12, 368
LDI r13, 52
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
