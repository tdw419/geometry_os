; DESCRIPTION: Draws a black rectangle at (154, 193) with width 117 and height 47.
; PLAN: r0=154(x), r1=193(y), r2=117(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 193
LDI r2, 117
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
