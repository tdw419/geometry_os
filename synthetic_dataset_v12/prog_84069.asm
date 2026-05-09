; DESCRIPTION: Composite: Places a blue circle of radius 17 at center (258, 99) then Places a red 46x92 rectangle at position (41, 85).
; PLAN: r0=258(x), r1=99(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=85(y), r7=46(width), r8=92(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 99
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 85
LDI r7, 46
LDI r8, 92
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
