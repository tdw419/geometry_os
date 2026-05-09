; DESCRIPTION: Composite: Sets a single purple pixel at (234, 149) then Places a cyan circle of radius 54 at center (388, 73) then Draws a red rectangle at (202, 60) with width 18 and height 78.
; PLAN: r0=234(x), r1=149(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=73(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=202(x), r11=60(y), r12=18(width), r13=78(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 149
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 73
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 202
LDI r11, 60
LDI r12, 18
LDI r13, 78
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
