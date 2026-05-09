; DESCRIPTION: Composite: Renders a white line between points (213, 174) and (5, 53) then Places a cyan circle of radius 28 at center (29, 77) then Sets a single blue pixel at (215, 108).
; PLAN: r0=213(x1), r1=174(y1), r2=5(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=77(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=215(x), r11=108(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 213
LDI r1, 174
LDI r2, 5
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 77
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 215
LDI r11, 108
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
