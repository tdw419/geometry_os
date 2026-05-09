; DESCRIPTION: Draws a black rectangle at (164, 46) with width 45 and height 99.
; PLAN: r0=164(x), r1=46(y), r2=45(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 46
LDI r2, 45
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
