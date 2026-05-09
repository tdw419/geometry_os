; DESCRIPTION: Composite: Places a white circle of radius 47 at center (368, 209) then Creates a cyan rectangular region at (141, 45) spanning 98 by 116 pixels.
; PLAN: r0=368(x), r1=209(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=45(y), r7=98(width), r8=116(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 209
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 45
LDI r7, 98
LDI r8, 116
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
