; DESCRIPTION: Composite: Renders a red line between points (184, 212) and (173, 55) then Places a yellow dot at position (50, 224) then Creates a green rectangular region at (370, 90) spanning 59 by 105 pixels.
; PLAN: r0=184(x1), r1=212(y1), r2=173(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=224(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=370(x), r11=90(y), r12=59(width), r13=105(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 212
LDI r2, 173
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 224
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 370
LDI r11, 90
LDI r12, 59
LDI r13, 105
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
