; DESCRIPTION: Composite: Places a white 81x111 rectangle at position (10, 37) then Places a yellow circle of radius 12 at center (328, 182).
; PLAN: r0=10(x), r1=37(y), r2=81(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=182(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 10
LDI r1, 37
LDI r2, 81
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 182
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
