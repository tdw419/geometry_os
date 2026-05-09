; DESCRIPTION: Composite: Draws a magenta circle centered at (357, 99) with radius 52 then Places a black line segment connecting (27, 238) to (293, 164) then Creates a cyan rectangular region at (76, 48) spanning 111 by 119 pixels.
; PLAN: r0=357(x), r1=99(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x1), r6=238(y1), r7=293(x2), r8=164(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=48(y), r12=111(width), r13=119(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 99
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 238
LDI r7, 293
LDI r8, 164
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 48
LDI r12, 111
LDI r13, 119
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
