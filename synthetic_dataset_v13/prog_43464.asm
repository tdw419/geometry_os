; DESCRIPTION: Composite: Creates a white circular shape at (367, 75) with radius 75 then Creates a cyan rectangular region at (225, 104) spanning 120 by 82 pixels.
; PLAN: r0=367(x), r1=75(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=104(y), r7=120(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 75
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 104
LDI r7, 120
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
