; DESCRIPTION: Composite: Places a black dot at position (80, 70) then Creates a magenta circular shape at (120, 121) with radius 52 then Places a cyan 64x82 rectangle at position (353, 39).
; PLAN: r0=80(x), r1=70(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=121(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=353(x), r11=39(y), r12=64(width), r13=82(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 70
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 120
LDI r6, 121
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 353
LDI r11, 39
LDI r12, 64
LDI r13, 82
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
