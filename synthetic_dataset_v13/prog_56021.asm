; DESCRIPTION: Composite: Renders a yellow box of size 92x109 starting at (80, 44) then Renders a black disk with center (130, 86) and radius 69.
; PLAN: r0=80(x), r1=44(y), r2=92(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=86(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 44
LDI r2, 92
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 86
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
