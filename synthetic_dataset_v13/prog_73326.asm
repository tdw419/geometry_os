; DESCRIPTION: Composite: Creates a red rectangular region at (323, 57) spanning 108 by 36 pixels then Draws a cyan circle centered at (292, 29) with radius 15 then Draws a yellow line from (233, 208) to (428, 253).
; PLAN: r0=323(x), r1=57(y), r2=108(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=29(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=233(x1), r11=208(y1), r12=428(x2), r13=253(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 57
LDI r2, 108
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 29
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 233
LDI r11, 208
LDI r12, 428
LDI r13, 253
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
