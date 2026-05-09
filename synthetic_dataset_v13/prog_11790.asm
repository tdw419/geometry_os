; DESCRIPTION: Composite: Renders a blue box of size 22x98 starting at (267, 129) then Sets a single green pixel at (245, 135) then Creates a green circular shape at (114, 108) with radius 72.
; PLAN: r0=267(x), r1=129(y), r2=22(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=135(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=114(x), r11=108(y), r12=72(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 129
LDI r2, 22
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 135
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 114
LDI r11, 108
LDI r12, 72
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
