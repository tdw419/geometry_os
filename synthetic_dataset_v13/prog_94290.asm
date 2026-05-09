; DESCRIPTION: Composite: Creates a yellow circular shape at (192, 138) with radius 43 then Places a orange 20x54 rectangle at position (445, 33).
; PLAN: r0=192(x), r1=138(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=33(y), r7=20(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 138
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 33
LDI r7, 20
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
