; DESCRIPTION: Composite: Creates a magenta rectangular region at (240, 142) spanning 70 by 42 pixels then Places a yellow circle of radius 28 at center (368, 121) then Draws a red line from (112, 32) to (450, 27).
; PLAN: r0=240(x), r1=142(y), r2=70(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=121(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x1), r11=32(y1), r12=450(x2), r13=27(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 142
LDI r2, 70
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 121
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 32
LDI r12, 450
LDI r13, 27
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
