; DESCRIPTION: Composite: Places a green 120x49 rectangle at position (337, 113) then Draws a red circle centered at (481, 110) with radius 17.
; PLAN: r0=337(x), r1=113(y), r2=120(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=110(y), r7=17(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 113
LDI r2, 120
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 110
LDI r7, 17
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
