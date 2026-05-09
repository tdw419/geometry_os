; DESCRIPTION: Composite: Renders a black box of size 78x115 starting at (270, 44) then Places a yellow circle of radius 44 at center (60, 50).
; PLAN: r0=270(x), r1=44(y), r2=78(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=50(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 44
LDI r2, 78
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 50
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
