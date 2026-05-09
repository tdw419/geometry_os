; DESCRIPTION: Draws a white rectangle at (45, 14) with width 82 and height 91.
; PLAN: r0=45(x), r1=14(y), r2=82(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 14
LDI r2, 82
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
