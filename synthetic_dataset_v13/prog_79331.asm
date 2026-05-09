; DESCRIPTION: Composite: Sets a single magenta pixel at (381, 175) then Creates a red rectangular region at (230, 146) spanning 50 by 37 pixels then Places a blue circle of radius 61 at center (143, 117).
; PLAN: r0=381(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=146(y), r7=50(width), r8=37(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x), r11=117(y), r12=61(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 381
LDI r1, 175
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 146
LDI r7, 50
LDI r8, 37
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 117
LDI r12, 61
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
