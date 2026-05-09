; DESCRIPTION: Composite: Draws a orange circle centered at (63, 189) with radius 48 then Places a magenta 62x50 rectangle at position (286, 103) then Sets a single black pixel at (401, 10).
; PLAN: r0=63(x), r1=189(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=103(y), r7=62(width), r8=50(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x), r11=10(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 63
LDI r1, 189
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 103
LDI r7, 62
LDI r8, 50
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 10
LDI r12, 0x000000
PSET r10, r11, r12
HALT
