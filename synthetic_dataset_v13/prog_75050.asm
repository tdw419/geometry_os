; DESCRIPTION: Composite: Places a black dot at position (324, 120) then Renders a magenta box of size 99x33 starting at (278, 127) then Creates a yellow circular shape at (313, 214) with radius 24.
; PLAN: r0=324(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=127(y), r7=99(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x), r11=214(y), r12=24(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 120
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 278
LDI r6, 127
LDI r7, 99
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 214
LDI r12, 24
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
