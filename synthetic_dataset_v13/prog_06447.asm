; DESCRIPTION: Composite: Creates a red rectangular region at (37, 171) spanning 79 by 34 pixels then Creates a cyan circular shape at (328, 150) with radius 77 then Places a white dot at position (164, 83).
; PLAN: r0=37(x), r1=171(y), r2=79(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=150(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=164(x), r11=83(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 171
LDI r2, 79
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 150
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 164
LDI r11, 83
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
