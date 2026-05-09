; DESCRIPTION: Composite: Renders a orange disk with center (378, 61) and radius 56 then Places a green 32x102 rectangle at position (71, 20) then Places a blue dot at position (145, 13).
; PLAN: r0=378(x), r1=61(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=20(y), r7=32(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x), r11=13(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 61
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 20
LDI r7, 32
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 13
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
