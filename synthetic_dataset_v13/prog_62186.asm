; DESCRIPTION: Composite: Places a magenta dot at position (13, 82) then Places a black circle of radius 74 at center (182, 156) then Renders a magenta box of size 25x15 starting at (129, 188).
; PLAN: r0=13(x), r1=82(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=156(y), r7=74(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x), r11=188(y), r12=25(width), r13=15(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 82
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 182
LDI r6, 156
LDI r7, 74
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 188
LDI r12, 25
LDI r13, 15
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
