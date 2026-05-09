; DESCRIPTION: Composite: Renders a red box of size 50x37 starting at (375, 16) then Places a cyan circle of radius 78 at center (125, 126) then Draws a magenta line from (346, 167) to (173, 64).
; PLAN: r0=375(x), r1=16(y), r2=50(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=126(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x1), r11=167(y1), r12=173(x2), r13=64(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 16
LDI r2, 50
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 126
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 167
LDI r12, 173
LDI r13, 64
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
