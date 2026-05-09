; DESCRIPTION: Composite: Sets a single cyan pixel at (495, 121) then Draws a green circle centered at (441, 133) with radius 16 then Renders a black box of size 73x119 starting at (22, 32).
; PLAN: r0=495(x), r1=121(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=133(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=22(x), r11=32(y), r12=73(width), r13=119(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 121
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 133
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 22
LDI r11, 32
LDI r12, 73
LDI r13, 119
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
