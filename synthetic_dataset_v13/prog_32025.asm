; DESCRIPTION: Composite: Renders a green box of size 21x37 starting at (337, 111) then Places a black dot at position (218, 112) then Creates a black circular shape at (135, 72) with radius 58.
; PLAN: r0=337(x), r1=111(y), r2=21(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=112(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=135(x), r11=72(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 111
LDI r2, 21
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 112
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 135
LDI r11, 72
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
