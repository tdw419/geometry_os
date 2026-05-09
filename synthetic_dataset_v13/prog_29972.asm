; DESCRIPTION: Composite: Places a magenta line segment connecting (125, 5) to (320, 193) then Creates a red rectangular region at (176, 194) spanning 30 by 47 pixels then Places a magenta circle of radius 42 at center (128, 189).
; PLAN: r0=125(x1), r1=5(y1), r2=320(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=194(y), r7=30(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=128(x), r11=189(y), r12=42(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 5
LDI r2, 320
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 194
LDI r7, 30
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 189
LDI r12, 42
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
