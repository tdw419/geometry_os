; DESCRIPTION: Composite: Places a blue dot at position (384, 125) then Creates a blue circular shape at (265, 91) with radius 50 then Renders a purple box of size 44x106 starting at (201, 47).
; PLAN: r0=384(x), r1=125(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=91(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=201(x), r11=47(y), r12=44(width), r13=106(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 125
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 91
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 201
LDI r11, 47
LDI r12, 44
LDI r13, 106
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
