; DESCRIPTION: Composite: Renders a green disk with center (124, 159) and radius 79 then Places a yellow 98x103 rectangle at position (65, 151).
; PLAN: r0=124(x), r1=159(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=151(y), r7=98(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 159
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 151
LDI r7, 98
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
