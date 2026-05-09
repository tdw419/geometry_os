; DESCRIPTION: Composite: Places a magenta 68x31 rectangle at position (271, 79) then Sets a single black pixel at (274, 89) then Draws a orange circle centered at (146, 129) with radius 36.
; PLAN: r0=271(x), r1=79(y), r2=68(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=89(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=129(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 79
LDI r2, 68
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 89
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 146
LDI r11, 129
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
