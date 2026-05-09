; DESCRIPTION: Composite: Places a magenta dot at position (132, 122) then Renders a purple box of size 18x67 starting at (92, 161) then Creates a cyan circular shape at (421, 157) with radius 76.
; PLAN: r0=132(x), r1=122(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=161(y), r7=18(width), r8=67(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x), r11=157(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 122
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 161
LDI r7, 18
LDI r8, 67
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 157
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
