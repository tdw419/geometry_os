; DESCRIPTION: Composite: Places a yellow 66x94 rectangle at position (150, 154) then Creates a green circular shape at (410, 167) with radius 56.
; PLAN: r0=150(x), r1=154(y), r2=66(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=167(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 150
LDI r1, 154
LDI r2, 66
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 167
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
