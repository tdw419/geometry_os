; DESCRIPTION: Composite: Sets a single cyan pixel at (21, 24) then Renders a purple disk with center (251, 164) and radius 51 then Creates a magenta rectangular region at (72, 117) spanning 55 by 91 pixels.
; PLAN: r0=21(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=164(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=117(y), r12=55(width), r13=91(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 164
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 117
LDI r12, 55
LDI r13, 91
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
