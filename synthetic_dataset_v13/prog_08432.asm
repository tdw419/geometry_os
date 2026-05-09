; DESCRIPTION: Composite: Creates a purple rectangular region at (433, 75) spanning 34 by 82 pixels then Renders a cyan disk with center (82, 62) and radius 55 then Draws a yellow line from (385, 93) to (351, 100).
; PLAN: r0=433(x), r1=75(y), r2=34(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=62(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x1), r11=93(y1), r12=351(x2), r13=100(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 75
LDI r2, 34
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 62
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 93
LDI r12, 351
LDI r13, 100
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
