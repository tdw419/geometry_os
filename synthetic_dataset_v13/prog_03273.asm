; DESCRIPTION: Composite: Places a yellow circle of radius 80 at center (252, 173) then Places a magenta dot at position (87, 189) then Renders a magenta box of size 87x57 starting at (27, 90).
; PLAN: r0=252(x), r1=173(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=189(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=27(x), r11=90(y), r12=87(width), r13=57(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 173
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 189
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 27
LDI r11, 90
LDI r12, 87
LDI r13, 57
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
