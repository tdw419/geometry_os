; DESCRIPTION: Composite: Creates a blue circular shape at (169, 130) with radius 78 then Places a black 103x90 rectangle at position (145, 150).
; PLAN: r0=169(x), r1=130(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=150(y), r7=103(width), r8=90(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 130
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 150
LDI r7, 103
LDI r8, 90
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
