; DESCRIPTION: Composite: Sets a single magenta pixel at (154, 140) then Renders a black disk with center (395, 182) and radius 32 then Renders a black box of size 113x37 starting at (362, 159).
; PLAN: r0=154(x), r1=140(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=182(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=362(x), r11=159(y), r12=113(width), r13=37(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 140
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 395
LDI r6, 182
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 362
LDI r11, 159
LDI r12, 113
LDI r13, 37
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
