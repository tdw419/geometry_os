; DESCRIPTION: Composite: Creates a yellow circular shape at (88, 147) with radius 49 then Places a blue 55x105 rectangle at position (445, 22).
; PLAN: r0=88(x), r1=147(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=22(y), r7=55(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 147
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 22
LDI r7, 55
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
