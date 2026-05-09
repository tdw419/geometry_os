; DESCRIPTION: Composite: Sets a single purple pixel at (118, 237) then Places a cyan line segment connecting (481, 85) to (135, 33) then Draws a cyan circle centered at (333, 141) with radius 72.
; PLAN: r0=118(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=481(x1), r6=85(y1), r7=135(x2), r8=33(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=141(y), r12=72(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 481
LDI r6, 85
LDI r7, 135
LDI r8, 33
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 141
LDI r12, 72
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
