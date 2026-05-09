; DESCRIPTION: Composite: Draws a magenta circle centered at (203, 151) with radius 70 then Renders a cyan line between points (75, 42) and (421, 115) then Creates a cyan rectangular region at (458, 128) spanning 30 by 49 pixels.
; PLAN: r0=203(x), r1=151(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x1), r6=42(y1), r7=421(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=128(y), r12=30(width), r13=49(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 151
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 42
LDI r7, 421
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 128
LDI r12, 30
LDI r13, 49
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
