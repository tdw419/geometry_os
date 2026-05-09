; DESCRIPTION: Draws a blue rectangle at (394, 163) with width 101 and height 55.
; PLAN: r0=394(x), r1=163(y), r2=101(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 163
LDI r2, 101
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
