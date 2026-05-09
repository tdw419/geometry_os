; DESCRIPTION: Composite: Draws a red rectangle at (309, 158) with width 77 and height 91 then Sets a single magenta pixel at (32, 183) then Draws a magenta line from (399, 58) to (346, 67).
; PLAN: r0=309(x), r1=158(y), r2=77(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=399(x1), r11=58(y1), r12=346(x2), r13=67(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 158
LDI r2, 77
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 399
LDI r11, 58
LDI r12, 346
LDI r13, 67
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
