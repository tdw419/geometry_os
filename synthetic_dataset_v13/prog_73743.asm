; DESCRIPTION: Composite: Creates a orange circular shape at (337, 96) with radius 66 then Places a magenta dot at position (269, 221) then Creates a cyan rectangular region at (235, 176) spanning 18 by 26 pixels.
; PLAN: r0=337(x), r1=96(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=221(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=176(y), r12=18(width), r13=26(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 96
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 221
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 235
LDI r11, 176
LDI r12, 18
LDI r13, 26
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
