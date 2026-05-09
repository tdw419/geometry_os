; DESCRIPTION: Composite: Renders a magenta box of size 104x39 starting at (399, 144) then Renders a blue disk with center (117, 185) and radius 18 then Sets a single black pixel at (335, 86).
; PLAN: r0=399(x), r1=144(y), r2=104(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=185(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x), r11=86(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 144
LDI r2, 104
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 185
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 86
LDI r12, 0x000000
PSET r10, r11, r12
HALT
