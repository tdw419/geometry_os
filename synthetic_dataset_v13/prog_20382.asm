; DESCRIPTION: Composite: Places a red 108x118 rectangle at position (326, 70) then Draws a cyan circle centered at (260, 170) with radius 32.
; PLAN: r0=326(x), r1=70(y), r2=108(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=170(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 70
LDI r2, 108
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 170
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
