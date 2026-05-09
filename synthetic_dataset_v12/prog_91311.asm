; DESCRIPTION: Composite: Renders a blue box of size 10x114 starting at (373, 25) then Places a purple circle of radius 19 at center (380, 235).
; PLAN: r0=373(x), r1=25(y), r2=10(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x), r6=235(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 373
LDI r1, 25
LDI r2, 10
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 235
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
