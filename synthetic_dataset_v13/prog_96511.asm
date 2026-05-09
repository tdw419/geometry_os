; DESCRIPTION: Composite: Creates a black rectangular region at (426, 73) spanning 39 by 31 pixels then Sets a single magenta pixel at (187, 9) then Places a cyan circle of radius 18 at center (471, 228).
; PLAN: r0=426(x), r1=73(y), r2=39(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=9(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=471(x), r11=228(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 73
LDI r2, 39
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 9
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 471
LDI r11, 228
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
