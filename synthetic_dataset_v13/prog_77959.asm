; DESCRIPTION: Composite: Places a white circle of radius 58 at center (239, 170) then Places a blue 47x42 rectangle at position (294, 78).
; PLAN: r0=239(x), r1=170(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=78(y), r7=47(width), r8=42(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 170
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 78
LDI r7, 47
LDI r8, 42
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
