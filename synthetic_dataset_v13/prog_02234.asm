; DESCRIPTION: Composite: Places a white 52x47 rectangle at position (441, 55) then Creates a magenta circular shape at (273, 186) with radius 47 then Places a green dot at position (8, 107).
; PLAN: r0=441(x), r1=55(y), r2=52(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=186(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=107(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 55
LDI r2, 52
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 186
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 107
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
