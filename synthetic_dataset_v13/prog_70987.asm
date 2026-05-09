; DESCRIPTION: Composite: Creates a black rectangular region at (453, 225) spanning 14 by 28 pixels then Draws a cyan circle centered at (436, 209) with radius 28 then Places a yellow dot at position (120, 187).
; PLAN: r0=453(x), r1=225(y), r2=14(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=209(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=187(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 225
LDI r2, 14
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 209
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 187
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
