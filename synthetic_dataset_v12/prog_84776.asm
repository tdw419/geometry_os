; DESCRIPTION: Composite: Places a black dot at position (386, 194) then Draws a white circle centered at (397, 90) with radius 71 then Draws a black rectangle at (57, 41) with width 57 and height 113.
; PLAN: r0=386(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=90(y), r7=71(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=57(x), r11=41(y), r12=57(width), r13=113(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 397
LDI r6, 90
LDI r7, 71
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 57
LDI r11, 41
LDI r12, 57
LDI r13, 113
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
