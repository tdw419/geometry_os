; DESCRIPTION: Composite: Renders a green disk with center (317, 112) and radius 14 then Places a yellow 114x43 rectangle at position (224, 162) then Places a purple dot at position (510, 225).
; PLAN: r0=317(x), r1=112(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x), r6=162(y), r7=114(width), r8=43(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=510(x), r11=225(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 112
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 162
LDI r7, 114
LDI r8, 43
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 510
LDI r11, 225
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
