; DESCRIPTION: Composite: Renders a yellow box of size 25x74 starting at (187, 49) then Places a yellow circle of radius 21 at center (345, 88).
; PLAN: r0=187(x), r1=49(y), r2=25(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=88(y), r7=21(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 49
LDI r2, 25
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 88
LDI r7, 21
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
