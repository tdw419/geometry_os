; DESCRIPTION: Composite: Renders a blue box of size 40x102 starting at (70, 152) then Draws a black circle centered at (217, 125) with radius 48.
; PLAN: r0=70(x), r1=152(y), r2=40(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=125(y), r7=48(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 152
LDI r2, 40
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 125
LDI r7, 48
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
