; DESCRIPTION: Composite: Draws a white line from (303, 228) to (431, 136) then Creates a purple rectangular region at (269, 70) spanning 40 by 74 pixels then Sets a single white pixel at (253, 43).
; PLAN: r0=303(x1), r1=228(y1), r2=431(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=70(y), r7=40(width), r8=74(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=43(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 228
LDI r2, 431
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 70
LDI r7, 40
LDI r8, 74
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 43
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
