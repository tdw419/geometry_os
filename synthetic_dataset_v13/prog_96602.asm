; DESCRIPTION: Composite: Creates a magenta circular shape at (244, 106) with radius 42 then Places a yellow line segment connecting (322, 102) to (171, 213) then Sets a single purple pixel at (55, 29).
; PLAN: r0=244(x), r1=106(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=102(y1), r7=171(x2), r8=213(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=29(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 106
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 102
LDI r7, 171
LDI r8, 213
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 29
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
