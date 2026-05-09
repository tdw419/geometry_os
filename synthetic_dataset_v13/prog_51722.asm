; DESCRIPTION: Composite: Renders a green box of size 65x37 starting at (160, 189) then Creates a purple circular shape at (298, 169) with radius 71.
; PLAN: r0=160(x), r1=189(y), r2=65(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=169(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 160
LDI r1, 189
LDI r2, 65
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 169
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
