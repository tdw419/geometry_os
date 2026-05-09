; DESCRIPTION: Composite: Sets a single purple pixel at (485, 17) then Creates a white rectangular region at (198, 62) spanning 54 by 93 pixels then Draws a cyan line from (477, 177) to (254, 168).
; PLAN: r0=485(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=198(x), r6=62(y), r7=54(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=477(x1), r11=177(y1), r12=254(x2), r13=168(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 485
LDI r1, 17
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 198
LDI r6, 62
LDI r7, 54
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 477
LDI r11, 177
LDI r12, 254
LDI r13, 168
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
