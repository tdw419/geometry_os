; DESCRIPTION: Composite: Places a magenta dot at position (241, 128) then Renders a cyan disk with center (74, 46) and radius 17 then Draws a magenta rectangle at (177, 61) with width 74 and height 119.
; PLAN: r0=241(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=46(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=177(x), r11=61(y), r12=74(width), r13=119(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 74
LDI r6, 46
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 177
LDI r11, 61
LDI r12, 74
LDI r13, 119
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
