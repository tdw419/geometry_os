; DESCRIPTION: Composite: Places a magenta dot at position (472, 213) then Places a magenta circle of radius 30 at center (434, 217) then Places a white line segment connecting (284, 151) to (166, 203).
; PLAN: r0=472(x), r1=213(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=217(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x1), r11=151(y1), r12=166(x2), r13=203(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 213
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 217
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 151
LDI r12, 166
LDI r13, 203
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
