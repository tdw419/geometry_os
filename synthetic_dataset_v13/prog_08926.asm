; DESCRIPTION: Composite: Draws a yellow rectangle at (38, 21) with width 59 and height 48 then Sets a single blue pixel at (171, 23) then Creates a cyan circular shape at (168, 68) with radius 46.
; PLAN: r0=38(x), r1=21(y), r2=59(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=23(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=68(y), r12=46(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 38
LDI r1, 21
LDI r2, 59
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 23
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 68
LDI r12, 46
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
