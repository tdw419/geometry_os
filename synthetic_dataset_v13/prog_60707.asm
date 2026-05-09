; DESCRIPTION: Composite: Renders a black box of size 115x100 starting at (394, 79) then Renders a blue disk with center (409, 98) and radius 78.
; PLAN: r0=394(x), r1=79(y), r2=115(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=98(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 79
LDI r2, 115
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 98
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
