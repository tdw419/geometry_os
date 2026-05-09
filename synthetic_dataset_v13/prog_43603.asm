; DESCRIPTION: Composite: Renders a white box of size 59x10 starting at (40, 238) then Sets a single green pixel at (330, 129) then Renders a black disk with center (193, 124) and radius 61.
; PLAN: r0=40(x), r1=238(y), r2=59(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=129(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=193(x), r11=124(y), r12=61(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 40
LDI r1, 238
LDI r2, 59
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 129
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 193
LDI r11, 124
LDI r12, 61
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
