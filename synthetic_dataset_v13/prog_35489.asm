; DESCRIPTION: Composite: Creates a cyan circular shape at (299, 218) with radius 30 then Places a green line segment connecting (195, 113) to (112, 18) then Places a yellow dot at position (262, 153).
; PLAN: r0=299(x), r1=218(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x1), r6=113(y1), r7=112(x2), r8=18(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=153(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 299
LDI r1, 218
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 113
LDI r7, 112
LDI r8, 18
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 153
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
