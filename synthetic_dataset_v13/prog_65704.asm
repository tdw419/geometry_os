; DESCRIPTION: Composite: Places a magenta 70x18 rectangle at position (161, 78) then Places a black circle of radius 23 at center (401, 223).
; PLAN: r0=161(x), r1=78(y), r2=70(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=223(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 78
LDI r2, 70
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 223
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
