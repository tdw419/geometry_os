; DESCRIPTION: Composite: Renders a green disk with center (337, 84) and radius 41 then Renders a yellow box of size 33x92 starting at (99, 130) then Places a cyan dot at position (402, 17).
; PLAN: r0=337(x), r1=84(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=130(y), r7=33(width), r8=92(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=402(x), r11=17(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 84
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 130
LDI r7, 33
LDI r8, 92
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 17
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
