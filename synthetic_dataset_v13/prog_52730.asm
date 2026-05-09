; DESCRIPTION: Composite: Places a purple dot at position (230, 213) then Places a blue circle of radius 23 at center (279, 71) then Renders a red box of size 47x106 starting at (98, 64).
; PLAN: r0=230(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=71(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=64(y), r12=47(width), r13=106(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 71
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 64
LDI r12, 47
LDI r13, 106
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
