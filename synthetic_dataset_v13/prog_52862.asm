; DESCRIPTION: Composite: Places a yellow circle of radius 34 at center (377, 193) then Renders a white box of size 29x74 starting at (339, 87).
; PLAN: r0=377(x), r1=193(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x), r6=87(y), r7=29(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 193
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 87
LDI r7, 29
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
