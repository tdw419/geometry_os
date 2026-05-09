; DESCRIPTION: Composite: Renders a cyan box of size 111x23 starting at (97, 165) then Places a blue circle of radius 34 at center (106, 34) then Places a black dot at position (407, 200).
; PLAN: r0=97(x), r1=165(y), r2=111(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=34(y), r7=34(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x), r11=200(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 165
LDI r2, 111
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 34
LDI r7, 34
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 200
LDI r12, 0x000000
PSET r10, r11, r12
HALT
