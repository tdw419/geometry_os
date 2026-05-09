; DESCRIPTION: Composite: Renders a blue line between points (309, 251) and (218, 66) then Places a orange circle of radius 50 at center (344, 164) then Places a white 70x91 rectangle at position (288, 111).
; PLAN: r0=309(x1), r1=251(y1), r2=218(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=164(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=288(x), r11=111(y), r12=70(width), r13=91(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 251
LDI r2, 218
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 164
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 288
LDI r11, 111
LDI r12, 70
LDI r13, 91
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
