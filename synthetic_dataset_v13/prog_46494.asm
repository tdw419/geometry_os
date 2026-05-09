; DESCRIPTION: Composite: Draws a red line from (373, 7) to (129, 168) then Creates a yellow circular shape at (166, 180) with radius 28 then Creates a cyan rectangular region at (19, 52) spanning 72 by 53 pixels.
; PLAN: r0=373(x1), r1=7(y1), r2=129(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=180(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x), r11=52(y), r12=72(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 7
LDI r2, 129
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 180
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 52
LDI r12, 72
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
