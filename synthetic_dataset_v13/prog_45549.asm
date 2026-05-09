; DESCRIPTION: Composite: Sets a single cyan pixel at (374, 20) then Creates a yellow rectangular region at (236, 124) spanning 109 by 46 pixels then Draws a purple circle centered at (382, 179) with radius 24.
; PLAN: r0=374(x), r1=20(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=124(y), r7=109(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x), r11=179(y), r12=24(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 374
LDI r1, 20
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 124
LDI r7, 109
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 179
LDI r12, 24
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
