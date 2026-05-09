; DESCRIPTION: Composite: Places a blue circle of radius 60 at center (443, 83) then Places a black 10x115 rectangle at position (216, 31).
; PLAN: r0=443(x), r1=83(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=31(y), r7=10(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 83
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 31
LDI r7, 10
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
