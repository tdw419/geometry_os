; DESCRIPTION: Composite: Places a magenta 80x69 rectangle at position (42, 132) then Renders a blue disk with center (310, 115) and radius 28.
; PLAN: r0=42(x), r1=132(y), r2=80(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=115(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 132
LDI r2, 80
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 115
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
