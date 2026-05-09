; DESCRIPTION: Composite: Renders a orange line between points (453, 184) and (242, 84) then Draws a cyan circle centered at (301, 161) with radius 62 then Places a black dot at position (224, 253).
; PLAN: r0=453(x1), r1=184(y1), r2=242(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=161(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=224(x), r11=253(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 453
LDI r1, 184
LDI r2, 242
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 161
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 224
LDI r11, 253
LDI r12, 0x000000
PSET r10, r11, r12
HALT
