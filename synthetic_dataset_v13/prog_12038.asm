; DESCRIPTION: Composite: Draws a white circle centered at (294, 161) with radius 57 then Renders a orange box of size 100x32 starting at (9, 119) then Places a black dot at position (388, 112).
; PLAN: r0=294(x), r1=161(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=119(y), r7=100(width), r8=32(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x), r11=112(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 161
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 119
LDI r7, 100
LDI r8, 32
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 112
LDI r12, 0x000000
PSET r10, r11, r12
HALT
