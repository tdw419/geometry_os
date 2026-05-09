; DESCRIPTION: Composite: Places a magenta dot at position (344, 138) then Creates a white circular shape at (93, 109) with radius 70 then Renders a red box of size 36x72 starting at (400, 182).
; PLAN: r0=344(x), r1=138(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=109(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x), r11=182(y), r12=36(width), r13=72(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 138
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 109
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 182
LDI r12, 36
LDI r13, 72
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
