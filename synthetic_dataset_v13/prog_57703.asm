; DESCRIPTION: Composite: Places a white 98x22 rectangle at position (372, 213) then Renders a white disk with center (134, 65) and radius 17.
; PLAN: r0=372(x), r1=213(y), r2=98(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x), r6=65(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 213
LDI r2, 98
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 65
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
