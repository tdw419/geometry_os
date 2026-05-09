; DESCRIPTION: Composite: Renders a green box of size 30x90 starting at (409, 106) then Places a black circle of radius 35 at center (293, 163).
; PLAN: r0=409(x), r1=106(y), r2=30(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=163(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 409
LDI r1, 106
LDI r2, 30
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 163
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
