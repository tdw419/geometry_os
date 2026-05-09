; DESCRIPTION: Composite: Places a blue 51x41 rectangle at position (21, 171) then Creates a orange circular shape at (202, 192) with radius 62.
; PLAN: r0=21(x), r1=171(y), r2=51(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=192(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 171
LDI r2, 51
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 192
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
