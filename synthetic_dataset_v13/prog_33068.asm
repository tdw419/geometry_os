; DESCRIPTION: Composite: Places a black circle of radius 38 at center (424, 218) then Places a white 24x69 rectangle at position (166, 36).
; PLAN: r0=424(x), r1=218(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=36(y), r7=24(width), r8=69(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 218
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 36
LDI r7, 24
LDI r8, 69
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
