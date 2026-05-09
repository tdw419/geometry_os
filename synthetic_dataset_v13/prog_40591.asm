; DESCRIPTION: Composite: Places a purple circle of radius 26 at center (320, 116) then Places a cyan dot at position (81, 190) then Renders a black box of size 51x14 starting at (156, 143).
; PLAN: r0=320(x), r1=116(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=190(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=156(x), r11=143(y), r12=51(width), r13=14(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 116
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 190
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 156
LDI r11, 143
LDI r12, 51
LDI r13, 14
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
