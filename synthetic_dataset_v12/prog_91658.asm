; DESCRIPTION: Draws a black rectangle at (45, 149) with width 91 and height 82.
; PLAN: r0=45(x), r1=149(y), r2=91(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 149
LDI r2, 91
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
