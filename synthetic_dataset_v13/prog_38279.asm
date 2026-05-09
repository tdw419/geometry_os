; DESCRIPTION: Composite: Places a green circle of radius 43 at center (235, 171) then Renders a purple box of size 33x36 starting at (341, 54) then Sets a single magenta pixel at (273, 62).
; PLAN: r0=235(x), r1=171(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=54(y), r7=33(width), r8=36(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=62(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 235
LDI r1, 171
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 54
LDI r7, 33
LDI r8, 36
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 62
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
