; DESCRIPTION: Composite: Creates a red rectangular region at (10, 46) spanning 39 by 78 pixels then Sets a single white pixel at (317, 212) then Renders a white disk with center (219, 85) and radius 21.
; PLAN: r0=10(x), r1=46(y), r2=39(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=212(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=85(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 46
LDI r2, 39
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 212
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 219
LDI r11, 85
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
