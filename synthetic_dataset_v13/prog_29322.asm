; DESCRIPTION: Composite: Creates a orange circular shape at (38, 133) with radius 17 then Sets a single orange pixel at (206, 196) then Renders a red box of size 84x90 starting at (158, 124).
; PLAN: r0=38(x), r1=133(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=196(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=124(y), r12=84(width), r13=90(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 133
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 196
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 158
LDI r11, 124
LDI r12, 84
LDI r13, 90
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
