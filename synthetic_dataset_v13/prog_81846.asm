; DESCRIPTION: Composite: Renders a purple disk with center (186, 165) and radius 42 then Sets a single purple pixel at (173, 116) then Renders a red box of size 80x63 starting at (172, 92).
; PLAN: r0=186(x), r1=165(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=116(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=172(x), r11=92(y), r12=80(width), r13=63(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 165
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 116
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 172
LDI r11, 92
LDI r12, 80
LDI r13, 63
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
