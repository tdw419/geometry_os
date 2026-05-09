; DESCRIPTION: Composite: Creates a purple circular shape at (408, 152) with radius 71 then Places a black dot at position (85, 171) then Renders a purple box of size 42x55 starting at (408, 85).
; PLAN: r0=408(x), r1=152(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=171(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=408(x), r11=85(y), r12=42(width), r13=55(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 152
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 171
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 408
LDI r11, 85
LDI r12, 42
LDI r13, 55
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
