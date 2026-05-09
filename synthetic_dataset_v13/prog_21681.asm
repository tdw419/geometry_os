; DESCRIPTION: Composite: Renders a black box of size 26x74 starting at (92, 181) then Places a purple dot at position (446, 23) then Renders a cyan disk with center (242, 130) and radius 57.
; PLAN: r0=92(x), r1=181(y), r2=26(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=23(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=242(x), r11=130(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 181
LDI r2, 26
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 23
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 242
LDI r11, 130
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
