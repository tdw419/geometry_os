; DESCRIPTION: Composite: Sets a single blue pixel at (502, 69) then Places a cyan 82x106 rectangle at position (10, 85) then Renders a green disk with center (395, 189) and radius 14.
; PLAN: r0=502(x), r1=69(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=85(y), r7=82(width), r8=106(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=395(x), r11=189(y), r12=14(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 502
LDI r1, 69
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 85
LDI r7, 82
LDI r8, 106
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 189
LDI r12, 14
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
