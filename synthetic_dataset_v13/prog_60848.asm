; DESCRIPTION: Composite: Places a orange 91x11 rectangle at position (43, 25) then Creates a orange circular shape at (113, 164) with radius 70 then Places a green dot at position (504, 172).
; PLAN: r0=43(x), r1=25(y), r2=91(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=164(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x), r11=172(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 25
LDI r2, 91
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 164
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 172
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
