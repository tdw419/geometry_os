; DESCRIPTION: Composite: Places a cyan circle of radius 52 at center (134, 177) then Creates a white rectangular region at (346, 148) spanning 40 by 49 pixels.
; PLAN: r0=134(x), r1=177(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=148(y), r7=40(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 177
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 148
LDI r7, 40
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
