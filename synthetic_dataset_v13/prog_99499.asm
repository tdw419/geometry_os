; DESCRIPTION: Composite: Places a magenta dot at position (507, 228) then Draws a white circle centered at (251, 87) with radius 36 then Renders a black box of size 78x27 starting at (128, 141).
; PLAN: r0=507(x), r1=228(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=87(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=128(x), r11=141(y), r12=78(width), r13=27(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 228
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 87
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 128
LDI r11, 141
LDI r12, 78
LDI r13, 27
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
