; DESCRIPTION: Composite: Renders a cyan disk with center (359, 172) and radius 62 then Sets a single white pixel at (305, 217) then Creates a magenta rectangular region at (186, 71) spanning 51 by 40 pixels.
; PLAN: r0=359(x), r1=172(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=217(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=186(x), r11=71(y), r12=51(width), r13=40(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 172
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 217
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 186
LDI r11, 71
LDI r12, 51
LDI r13, 40
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
