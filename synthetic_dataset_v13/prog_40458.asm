; DESCRIPTION: Composite: Creates a magenta rectangular region at (91, 81) spanning 83 by 109 pixels then Places a magenta circle of radius 55 at center (456, 92) then Draws a cyan line from (324, 219) to (372, 161).
; PLAN: r0=91(x), r1=81(y), r2=83(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=92(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x1), r11=219(y1), r12=372(x2), r13=161(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 81
LDI r2, 83
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 92
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 219
LDI r12, 372
LDI r13, 161
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
