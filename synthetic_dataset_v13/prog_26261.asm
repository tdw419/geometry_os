; DESCRIPTION: Draws a black rectangle at (372, 91) with width 45 and height 82.
; PLAN: r0=372(x), r1=91(y), r2=45(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 91
LDI r2, 45
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
