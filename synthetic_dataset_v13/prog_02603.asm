; DESCRIPTION: Composite: Places a blue 57x46 rectangle at position (385, 57) then Renders a green disk with center (208, 109) and radius 76 then Places a blue dot at position (458, 170).
; PLAN: r0=385(x), r1=57(y), r2=57(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x), r6=109(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x), r11=170(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 385
LDI r1, 57
LDI r2, 57
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 109
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 170
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
