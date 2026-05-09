; DESCRIPTION: Composite: Renders a cyan disk with center (289, 132) and radius 49 then Places a yellow 100x21 rectangle at position (301, 77) then Places a green dot at position (109, 56).
; PLAN: r0=289(x), r1=132(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=77(y), r7=100(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=109(x), r11=56(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 132
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 77
LDI r7, 100
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 56
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
