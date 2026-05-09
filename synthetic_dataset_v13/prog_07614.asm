; DESCRIPTION: Composite: Draws a white circle centered at (349, 196) with radius 31 then Places a white dot at position (454, 246) then Places a cyan 73x35 rectangle at position (62, 220).
; PLAN: r0=349(x), r1=196(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=246(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=62(x), r11=220(y), r12=73(width), r13=35(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 196
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 246
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 62
LDI r11, 220
LDI r12, 73
LDI r13, 35
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
