; DESCRIPTION: Composite: Places a black 84x25 rectangle at position (341, 205) then Places a purple circle of radius 50 at center (337, 102).
; PLAN: r0=341(x), r1=205(y), r2=84(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=102(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 205
LDI r2, 84
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 102
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
