; DESCRIPTION: Composite: Creates a purple rectangular region at (150, 43) spanning 96 by 112 pixels then Sets a single white pixel at (113, 77) then Places a red line segment connecting (382, 112) to (480, 181).
; PLAN: r0=150(x), r1=43(y), r2=96(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=77(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=382(x1), r11=112(y1), r12=480(x2), r13=181(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 43
LDI r2, 96
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 77
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 382
LDI r11, 112
LDI r12, 480
LDI r13, 181
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
