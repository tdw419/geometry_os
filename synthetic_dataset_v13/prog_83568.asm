; DESCRIPTION: Composite: Renders a green box of size 111x48 starting at (20, 98) then Creates a green circular shape at (385, 103) with radius 33.
; PLAN: r0=20(x), r1=98(y), r2=111(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=103(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 20
LDI r1, 98
LDI r2, 111
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 103
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
