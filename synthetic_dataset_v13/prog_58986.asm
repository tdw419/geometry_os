; DESCRIPTION: Composite: Renders a red box of size 116x98 starting at (100, 80) then Creates a cyan circular shape at (434, 121) with radius 21 then Places a purple dot at position (52, 12).
; PLAN: r0=100(x), r1=80(y), r2=116(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=121(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x), r11=12(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 80
LDI r2, 116
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 121
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 12
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
