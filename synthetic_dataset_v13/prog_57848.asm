; DESCRIPTION: Composite: Renders a cyan box of size 116x23 starting at (298, 134) then Places a green circle of radius 65 at center (162, 151).
; PLAN: r0=298(x), r1=134(y), r2=116(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=151(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 134
LDI r2, 116
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 151
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
