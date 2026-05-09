; DESCRIPTION: Composite: Creates a red rectangular region at (403, 71) spanning 55 by 116 pixels then Sets a single magenta pixel at (36, 228) then Draws a green circle centered at (66, 162) with radius 34.
; PLAN: r0=403(x), r1=71(y), r2=55(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=228(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=66(x), r11=162(y), r12=34(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 403
LDI r1, 71
LDI r2, 55
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 228
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 162
LDI r12, 34
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
