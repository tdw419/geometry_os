; DESCRIPTION: Composite: Renders a yellow disk with center (315, 177) and radius 32 then Sets a single black pixel at (213, 157) then Places a green 76x24 rectangle at position (368, 172).
; PLAN: r0=315(x), r1=177(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=157(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=368(x), r11=172(y), r12=76(width), r13=24(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 177
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 157
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 368
LDI r11, 172
LDI r12, 76
LDI r13, 24
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
