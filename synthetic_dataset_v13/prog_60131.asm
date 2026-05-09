; DESCRIPTION: Composite: Draws a black circle centered at (121, 100) with radius 13 then Draws a yellow rectangle at (220, 150) with width 10 and height 103.
; PLAN: r0=121(x), r1=100(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=150(y), r7=10(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 100
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 150
LDI r7, 10
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
