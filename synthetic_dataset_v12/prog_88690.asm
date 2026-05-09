; DESCRIPTION: Composite: Creates a blue circular shape at (107, 181) with radius 37 then Places a magenta 27x68 rectangle at position (41, 182).
; PLAN: r0=107(x), r1=181(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=182(y), r7=27(width), r8=68(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 181
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 182
LDI r7, 27
LDI r8, 68
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
