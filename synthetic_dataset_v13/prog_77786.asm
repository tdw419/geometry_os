; DESCRIPTION: Composite: Places a black circle of radius 23 at center (301, 170) then Places a purple 120x55 rectangle at position (205, 121).
; PLAN: r0=301(x), r1=170(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=121(y), r7=120(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 170
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 121
LDI r7, 120
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
