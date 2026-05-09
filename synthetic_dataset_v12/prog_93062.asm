; DESCRIPTION: Composite: Renders a cyan box of size 21x79 starting at (71, 176) then Sets a single black pixel at (280, 66) then Renders a magenta disk with center (74, 101) and radius 72.
; PLAN: r0=71(x), r1=176(y), r2=21(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=66(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=101(y), r12=72(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 176
LDI r2, 21
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 66
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 74
LDI r11, 101
LDI r12, 72
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
