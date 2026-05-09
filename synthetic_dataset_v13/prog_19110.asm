; DESCRIPTION: Composite: Places a white circle of radius 23 at center (176, 180) then Places a black 75x62 rectangle at position (188, 97).
; PLAN: r0=176(x), r1=180(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=97(y), r7=75(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 180
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 97
LDI r7, 75
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
