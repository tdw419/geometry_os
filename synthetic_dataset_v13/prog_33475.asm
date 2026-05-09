; DESCRIPTION: Composite: Places a blue circle of radius 21 at center (116, 34) then Creates a white rectangular region at (408, 140) spanning 60 by 70 pixels then Places a green dot at position (507, 204).
; PLAN: r0=116(x), r1=34(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x), r6=140(y), r7=60(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=507(x), r11=204(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 34
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 140
LDI r7, 60
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 204
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
