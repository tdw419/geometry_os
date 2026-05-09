; DESCRIPTION: Composite: Places a white circle of radius 58 at center (243, 163) then Creates a orange rectangular region at (257, 143) spanning 71 by 91 pixels.
; PLAN: r0=243(x), r1=163(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=143(y), r7=71(width), r8=91(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 163
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 143
LDI r7, 71
LDI r8, 91
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
