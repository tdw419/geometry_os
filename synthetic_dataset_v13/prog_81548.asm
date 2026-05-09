; DESCRIPTION: Composite: Renders a yellow box of size 110x92 starting at (322, 27) then Draws a blue circle centered at (262, 59) with radius 30.
; PLAN: r0=322(x), r1=27(y), r2=110(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=59(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 27
LDI r2, 110
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 59
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
