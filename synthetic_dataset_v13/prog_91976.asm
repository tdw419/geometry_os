; DESCRIPTION: Composite: Creates a yellow circular shape at (282, 182) with radius 42 then Draws a red rectangle at (369, 53) with width 76 and height 73 then Draws a cyan line from (280, 141) to (390, 108).
; PLAN: r0=282(x), r1=182(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=53(y), r7=76(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x1), r11=141(y1), r12=390(x2), r13=108(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 182
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 53
LDI r7, 76
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 141
LDI r12, 390
LDI r13, 108
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
