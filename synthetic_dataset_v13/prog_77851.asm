; DESCRIPTION: Composite: Places a magenta dot at position (482, 88) then Draws a cyan circle centered at (431, 150) with radius 65 then Renders a blue box of size 32x23 starting at (371, 132).
; PLAN: r0=482(x), r1=88(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=150(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x), r11=132(y), r12=32(width), r13=23(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 88
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 431
LDI r6, 150
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 132
LDI r12, 32
LDI r13, 23
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
