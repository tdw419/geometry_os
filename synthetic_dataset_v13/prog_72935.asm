; DESCRIPTION: Composite: Creates a magenta rectangular region at (292, 200) spanning 92 by 40 pixels then Sets a single purple pixel at (182, 228) then Places a yellow line segment connecting (498, 236) to (77, 81).
; PLAN: r0=292(x), r1=200(y), r2=92(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=228(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=498(x1), r11=236(y1), r12=77(x2), r13=81(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 200
LDI r2, 92
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 228
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 498
LDI r11, 236
LDI r12, 77
LDI r13, 81
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
