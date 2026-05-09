; DESCRIPTION: Composite: Renders a cyan disk with center (436, 106) and radius 73 then Places a blue 26x71 rectangle at position (447, 27) then Places a blue dot at position (421, 1).
; PLAN: r0=436(x), r1=106(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=27(y), r7=26(width), r8=71(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x), r11=1(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 436
LDI r1, 106
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 27
LDI r7, 26
LDI r8, 71
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 1
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
