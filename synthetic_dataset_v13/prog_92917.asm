; DESCRIPTION: Composite: Places a yellow dot at position (451, 1) then Places a cyan 120x46 rectangle at position (310, 95) then Creates a green circular shape at (200, 120) with radius 73.
; PLAN: r0=451(x), r1=1(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=95(y), r7=120(width), r8=46(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x), r11=120(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 1
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 310
LDI r6, 95
LDI r7, 120
LDI r8, 46
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 120
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
