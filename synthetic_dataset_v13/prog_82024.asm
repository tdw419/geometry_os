; DESCRIPTION: Composite: Places a green 92x40 rectangle at position (220, 5) then Draws a black circle centered at (145, 115) with radius 24.
; PLAN: r0=220(x), r1=5(y), r2=92(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=115(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 220
LDI r1, 5
LDI r2, 92
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 115
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
