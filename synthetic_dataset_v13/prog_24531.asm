; DESCRIPTION: Composite: Renders a magenta box of size 96x112 starting at (272, 113) then Renders a red disk with center (204, 144) and radius 56 then Sets a single black pixel at (96, 46).
; PLAN: r0=272(x), r1=113(y), r2=96(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=144(y), r7=56(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x), r11=46(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 113
LDI r2, 96
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 144
LDI r7, 56
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 46
LDI r12, 0x000000
PSET r10, r11, r12
HALT
