; DESCRIPTION: Composite: Places a black circle of radius 12 at center (320, 45) then Renders a purple box of size 26x71 starting at (210, 103) then Places a black dot at position (20, 96).
; PLAN: r0=320(x), r1=45(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x), r6=103(y), r7=26(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=20(x), r11=96(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 320
LDI r1, 45
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 103
LDI r7, 26
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 96
LDI r12, 0x000000
PSET r10, r11, r12
HALT
