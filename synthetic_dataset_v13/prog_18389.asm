; DESCRIPTION: Composite: Places a cyan 21x64 rectangle at position (261, 34) then Renders a black disk with center (353, 184) and radius 15 then Places a red dot at position (499, 92).
; PLAN: r0=261(x), r1=34(y), r2=21(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=184(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=499(x), r11=92(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 261
LDI r1, 34
LDI r2, 21
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 184
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 499
LDI r11, 92
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
