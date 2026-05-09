; DESCRIPTION: Composite: Renders a red disk with center (123, 98) and radius 76 then Places a purple dot at position (154, 200) then Creates a purple rectangular region at (256, 42) spanning 80 by 43 pixels.
; PLAN: r0=123(x), r1=98(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=200(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=256(x), r11=42(y), r12=80(width), r13=43(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 98
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 200
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 256
LDI r11, 42
LDI r12, 80
LDI r13, 43
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
