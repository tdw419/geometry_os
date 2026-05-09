; DESCRIPTION: Composite: Renders a green box of size 100x103 starting at (259, 127) then Creates a blue circular shape at (392, 178) with radius 78.
; PLAN: r0=259(x), r1=127(y), r2=100(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=178(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 127
LDI r2, 100
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 178
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
