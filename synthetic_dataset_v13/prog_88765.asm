; DESCRIPTION: Composite: Creates a orange circular shape at (146, 152) with radius 70 then Creates a black rectangular region at (87, 186) spanning 72 by 25 pixels then Places a blue dot at position (0, 32).
; PLAN: r0=146(x), r1=152(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=186(y), r7=72(width), r8=25(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=0(x), r11=32(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 152
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 186
LDI r7, 72
LDI r8, 25
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 32
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
