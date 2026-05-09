; DESCRIPTION: Composite: Renders a cyan disk with center (356, 60) and radius 16 then Renders a orange box of size 62x66 starting at (93, 5) then Sets a single yellow pixel at (422, 232).
; PLAN: r0=356(x), r1=60(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=5(y), r7=62(width), r8=66(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=232(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 356
LDI r1, 60
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 5
LDI r7, 62
LDI r8, 66
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 232
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
