; DESCRIPTION: Composite: Places a magenta dot at position (405, 181) then Renders a yellow box of size 94x105 starting at (406, 112) then Creates a green circular shape at (400, 150) with radius 23.
; PLAN: r0=405(x), r1=181(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=112(y), r7=94(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x), r11=150(y), r12=23(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 405
LDI r1, 181
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 112
LDI r7, 94
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 150
LDI r12, 23
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
