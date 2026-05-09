; DESCRIPTION: Composite: Creates a white circular shape at (264, 135) with radius 68 then Sets a single orange pixel at (420, 194) then Renders a white box of size 84x116 starting at (377, 113).
; PLAN: r0=264(x), r1=135(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=194(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=113(y), r12=84(width), r13=116(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 135
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 194
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 377
LDI r11, 113
LDI r12, 84
LDI r13, 116
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
