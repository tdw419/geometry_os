; DESCRIPTION: Composite: Sets a single magenta pixel at (7, 29) then Creates a cyan circular shape at (442, 146) with radius 10 then Draws a magenta line from (430, 242) to (495, 122).
; PLAN: r0=7(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=442(x), r6=146(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x1), r11=242(y1), r12=495(x2), r13=122(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 7
LDI r1, 29
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 442
LDI r6, 146
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 242
LDI r12, 495
LDI r13, 122
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
