; DESCRIPTION: Composite: Renders a magenta box of size 96x109 starting at (323, 52) then Places a red circle of radius 70 at center (73, 154) then Places a black dot at position (345, 182).
; PLAN: r0=323(x), r1=52(y), r2=96(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=154(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x), r11=182(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 52
LDI r2, 96
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 154
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 182
LDI r12, 0x000000
PSET r10, r11, r12
HALT
