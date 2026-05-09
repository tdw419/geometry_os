; DESCRIPTION: Composite: Places a blue dot at position (210, 147) then Renders a blue disk with center (431, 79) and radius 27 then Renders a green box of size 79x61 starting at (310, 157).
; PLAN: r0=210(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=79(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x), r11=157(y), r12=79(width), r13=61(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 79
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 157
LDI r12, 79
LDI r13, 61
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
