; DESCRIPTION: Composite: Renders a yellow disk with center (195, 119) and radius 38 then Places a blue 105x90 rectangle at position (205, 59) then Sets a single red pixel at (360, 61).
; PLAN: r0=195(x), r1=119(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=59(y), r7=105(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x), r11=61(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 119
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 59
LDI r7, 105
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 61
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
