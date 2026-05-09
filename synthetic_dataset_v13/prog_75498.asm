; DESCRIPTION: Composite: Creates a cyan rectangular region at (112, 77) spanning 21 by 18 pixels then Places a yellow circle of radius 25 at center (140, 124) then Places a cyan dot at position (438, 232).
; PLAN: r0=112(x), r1=77(y), r2=21(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=124(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=438(x), r11=232(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 112
LDI r1, 77
LDI r2, 21
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 124
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 438
LDI r11, 232
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
