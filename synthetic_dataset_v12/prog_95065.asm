; DESCRIPTION: Composite: Creates a white circular shape at (260, 173) with radius 65 then Sets a single magenta pixel at (393, 176) then Places a green 16x27 rectangle at position (51, 34).
; PLAN: r0=260(x), r1=173(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=176(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=51(x), r11=34(y), r12=16(width), r13=27(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 173
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 176
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 34
LDI r12, 16
LDI r13, 27
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
