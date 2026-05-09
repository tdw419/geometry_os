; DESCRIPTION: Composite: Creates a orange circular shape at (96, 82) with radius 30 then Sets a single black pixel at (466, 247) then Renders a magenta box of size 89x103 starting at (101, 89).
; PLAN: r0=96(x), r1=82(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=247(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=89(y), r12=89(width), r13=103(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 82
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 247
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 101
LDI r11, 89
LDI r12, 89
LDI r13, 103
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
