; DESCRIPTION: Composite: Sets a single red pixel at (112, 151) then Draws a cyan line from (339, 142) to (478, 237) then Creates a yellow rectangular region at (256, 221) spanning 31 by 35 pixels.
; PLAN: r0=112(x), r1=151(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=142(y1), r7=478(x2), r8=237(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=221(y), r12=31(width), r13=35(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 151
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 339
LDI r6, 142
LDI r7, 478
LDI r8, 237
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 221
LDI r12, 31
LDI r13, 35
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
