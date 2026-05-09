; DESCRIPTION: Composite: Creates a orange circular shape at (440, 109) with radius 16 then Draws a green line from (309, 112) to (53, 164) then Renders a red box of size 65x37 starting at (70, 144).
; PLAN: r0=440(x), r1=109(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x1), r6=112(y1), r7=53(x2), r8=164(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=144(y), r12=65(width), r13=37(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 109
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 112
LDI r7, 53
LDI r8, 164
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 144
LDI r12, 65
LDI r13, 37
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
