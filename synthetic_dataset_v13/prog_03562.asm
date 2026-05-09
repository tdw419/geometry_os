; DESCRIPTION: Composite: Draws a cyan rectangle at (31, 168) with width 54 and height 14 then Places a white circle of radius 26 at center (63, 173).
; PLAN: r0=31(x), r1=168(y), r2=54(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=173(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 31
LDI r1, 168
LDI r2, 54
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 173
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
