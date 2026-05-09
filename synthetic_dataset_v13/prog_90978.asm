; DESCRIPTION: Draws a black rectangle at (399, 163) with width 16 and height 80.
; PLAN: r0=399(x), r1=163(y), r2=16(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 163
LDI r2, 16
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
