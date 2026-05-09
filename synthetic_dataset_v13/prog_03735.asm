; DESCRIPTION: Composite: Places a black 36x11 rectangle at position (13, 234) then Places a yellow circle of radius 78 at center (84, 171).
; PLAN: r0=13(x), r1=234(y), r2=36(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=171(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 234
LDI r2, 36
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 171
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
