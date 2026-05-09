; DESCRIPTION: Composite: Renders a white box of size 92x105 starting at (382, 140) then Creates a cyan circular shape at (187, 99) with radius 27 then Sets a single green pixel at (409, 246).
; PLAN: r0=382(x), r1=140(y), r2=92(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=99(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=409(x), r11=246(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 140
LDI r2, 92
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 99
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 409
LDI r11, 246
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
