; DESCRIPTION: Composite: Renders a cyan disk with center (166, 193) and radius 16 then Renders a magenta box of size 114x100 starting at (44, 104) then Sets a single red pixel at (310, 119).
; PLAN: r0=166(x), r1=193(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=104(y), r7=114(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=310(x), r11=119(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 193
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 104
LDI r7, 114
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 119
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
