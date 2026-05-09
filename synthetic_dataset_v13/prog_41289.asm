; DESCRIPTION: Composite: Draws a purple circle centered at (388, 151) with radius 60 then Sets a single white pixel at (405, 141) then Places a white 114x95 rectangle at position (298, 90).
; PLAN: r0=388(x), r1=151(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=141(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=90(y), r12=114(width), r13=95(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 151
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 141
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 298
LDI r11, 90
LDI r12, 114
LDI r13, 95
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
