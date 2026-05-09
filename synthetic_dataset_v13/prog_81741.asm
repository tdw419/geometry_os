; DESCRIPTION: Composite: Renders a yellow box of size 102x92 starting at (243, 151) then Creates a purple circular shape at (93, 82) with radius 78 then Sets a single yellow pixel at (178, 213).
; PLAN: r0=243(x), r1=151(y), r2=102(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=82(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x), r11=213(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 151
LDI r2, 102
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 82
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 213
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
