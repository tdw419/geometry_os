; DESCRIPTION: Composite: Renders a purple box of size 103x38 starting at (129, 140) then Draws a green circle centered at (175, 48) with radius 44.
; PLAN: r0=129(x), r1=140(y), r2=103(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=48(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 140
LDI r2, 103
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 48
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
