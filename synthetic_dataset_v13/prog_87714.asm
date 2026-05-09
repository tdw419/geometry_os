; DESCRIPTION: Composite: Sets a single purple pixel at (476, 237) then Draws a cyan line from (439, 168) to (205, 184) then Draws a cyan circle centered at (165, 146) with radius 65.
; PLAN: r0=476(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=439(x1), r6=168(y1), r7=205(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=146(y), r12=65(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 476
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 168
LDI r7, 205
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 146
LDI r12, 65
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
