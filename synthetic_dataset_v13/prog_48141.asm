; DESCRIPTION: Composite: Renders a black disk with center (114, 107) and radius 66 then Places a yellow 103x71 rectangle at position (96, 156).
; PLAN: r0=114(x), r1=107(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=156(y), r7=103(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 107
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 156
LDI r7, 103
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
