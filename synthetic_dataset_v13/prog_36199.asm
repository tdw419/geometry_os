; DESCRIPTION: Composite: Renders a cyan disk with center (312, 75) and radius 59 then Places a yellow 43x18 rectangle at position (259, 69).
; PLAN: r0=312(x), r1=75(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=69(y), r7=43(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 75
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 69
LDI r7, 43
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
