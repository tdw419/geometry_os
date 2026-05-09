; DESCRIPTION: Composite: Renders a purple disk with center (89, 113) and radius 17 then Sets a single orange pixel at (98, 47) then Renders a red box of size 85x42 starting at (245, 74).
; PLAN: r0=89(x), r1=113(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=47(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=74(y), r12=85(width), r13=42(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 113
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 47
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 245
LDI r11, 74
LDI r12, 85
LDI r13, 42
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
