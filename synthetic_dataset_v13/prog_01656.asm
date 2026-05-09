; DESCRIPTION: Draws a black rectangle at (394, 58) with width 72 and height 108.
; PLAN: r0=394(x), r1=58(y), r2=72(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 58
LDI r2, 72
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
