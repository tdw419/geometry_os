; DESCRIPTION: Draws a black rectangle at (321, 214) with width 117 and height 23.
; PLAN: r0=321(x), r1=214(y), r2=117(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 214
LDI r2, 117
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
