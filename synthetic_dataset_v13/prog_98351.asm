; DESCRIPTION: Draws a black rectangle at (386, 53) with width 14 and height 104.
; PLAN: r0=386(x), r1=53(y), r2=14(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 53
LDI r2, 14
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
