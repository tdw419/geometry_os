; DESCRIPTION: Composite: Renders a magenta box of size 93x89 starting at (328, 22) then Places a cyan circle of radius 36 at center (310, 51).
; PLAN: r0=328(x), r1=22(y), r2=93(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=51(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 22
LDI r2, 93
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 51
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
