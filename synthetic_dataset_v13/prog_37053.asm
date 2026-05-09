; DESCRIPTION: Composite: Draws a cyan circle centered at (291, 162) with radius 73 then Renders a black box of size 57x33 starting at (438, 61) then Sets a single purple pixel at (503, 77).
; PLAN: r0=291(x), r1=162(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=61(y), r7=57(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=503(x), r11=77(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 291
LDI r1, 162
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 61
LDI r7, 57
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 77
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
