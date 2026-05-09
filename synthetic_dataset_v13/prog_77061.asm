; DESCRIPTION: Composite: Creates a magenta circular shape at (288, 93) with radius 52 then Renders a black box of size 107x85 starting at (395, 49) then Draws a yellow line from (82, 3) to (281, 170).
; PLAN: r0=288(x), r1=93(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=49(y), r7=107(width), r8=85(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x1), r11=3(y1), r12=281(x2), r13=170(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 93
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 49
LDI r7, 107
LDI r8, 85
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 3
LDI r12, 281
LDI r13, 170
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
