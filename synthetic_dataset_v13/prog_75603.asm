; DESCRIPTION: Composite: Renders a yellow disk with center (123, 235) and radius 14 then Places a cyan dot at position (420, 238) then Creates a red rectangular region at (209, 109) spanning 83 by 103 pixels.
; PLAN: r0=123(x), r1=235(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=238(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=109(y), r12=83(width), r13=103(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 235
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 238
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 209
LDI r11, 109
LDI r12, 83
LDI r13, 103
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
