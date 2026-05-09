; DESCRIPTION: Composite: Places a white circle of radius 40 at center (43, 70) then Creates a black rectangular region at (388, 117) spanning 94 by 95 pixels.
; PLAN: r0=43(x), r1=70(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x), r6=117(y), r7=94(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 70
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 117
LDI r7, 94
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
