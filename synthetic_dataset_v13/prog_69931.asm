; DESCRIPTION: Composite: Renders a purple box of size 82x20 starting at (98, 138) then Renders a white disk with center (207, 134) and radius 60 then Sets a single green pixel at (281, 12).
; PLAN: r0=98(x), r1=138(y), r2=82(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=134(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x), r11=12(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 98
LDI r1, 138
LDI r2, 82
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 134
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 12
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
