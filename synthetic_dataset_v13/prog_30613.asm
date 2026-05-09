; DESCRIPTION: Composite: Draws a yellow line from (360, 239) to (293, 29) then Sets a single magenta pixel at (341, 155) then Creates a cyan rectangular region at (334, 121) spanning 19 by 38 pixels.
; PLAN: r0=360(x1), r1=239(y1), r2=293(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=155(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=334(x), r11=121(y), r12=19(width), r13=38(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 239
LDI r2, 293
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 155
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 334
LDI r11, 121
LDI r12, 19
LDI r13, 38
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
