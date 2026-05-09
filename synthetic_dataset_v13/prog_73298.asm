; DESCRIPTION: Composite: Places a black 52x46 rectangle at position (397, 135) then Renders a cyan disk with center (361, 36) and radius 24.
; PLAN: r0=397(x), r1=135(y), r2=52(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=36(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 135
LDI r2, 52
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 36
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
