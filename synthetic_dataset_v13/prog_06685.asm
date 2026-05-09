; DESCRIPTION: Composite: Draws a red circle centered at (239, 154) with radius 28 then Places a black 39x99 rectangle at position (327, 119).
; PLAN: r0=239(x), r1=154(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=119(y), r7=39(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 154
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 119
LDI r7, 39
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
