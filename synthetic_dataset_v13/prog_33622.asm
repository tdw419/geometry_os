; DESCRIPTION: Composite: Renders a black box of size 85x39 starting at (37, 129) then Places a purple circle of radius 53 at center (448, 181).
; PLAN: r0=37(x), r1=129(y), r2=85(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=181(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 129
LDI r2, 85
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 181
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
