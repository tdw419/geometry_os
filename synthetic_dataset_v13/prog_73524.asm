; DESCRIPTION: Composite: Renders a red disk with center (34, 198) and radius 28 then Renders a magenta box of size 42x41 starting at (59, 199) then Places a black dot at position (453, 151).
; PLAN: r0=34(x), r1=198(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=199(y), r7=42(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=453(x), r11=151(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 34
LDI r1, 198
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 199
LDI r7, 42
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 151
LDI r12, 0x000000
PSET r10, r11, r12
HALT
