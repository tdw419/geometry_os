; DESCRIPTION: Composite: Sets a single blue pixel at (487, 16) then Renders a cyan disk with center (136, 98) and radius 34 then Draws a blue rectangle at (1, 31) with width 104 and height 43.
; PLAN: r0=487(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=98(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=31(y), r12=104(width), r13=43(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 98
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 31
LDI r12, 104
LDI r13, 43
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
