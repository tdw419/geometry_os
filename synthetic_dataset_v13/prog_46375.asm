; DESCRIPTION: Composite: Sets a single cyan pixel at (302, 46) then Creates a orange rectangular region at (4, 24) spanning 47 by 35 pixels then Renders a magenta disk with center (112, 142) and radius 62.
; PLAN: r0=302(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=24(y), r7=47(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=112(x), r11=142(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 24
LDI r7, 47
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 142
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
