; DESCRIPTION: Draws a black rectangle at (293, 30) with width 42 and height 22.
; PLAN: r0=293(x), r1=30(y), r2=42(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 30
LDI r2, 42
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
