; DESCRIPTION: Draws a yellow rectangle at (66, 45) with width 32 and height 64.
; PLAN: r0=66(x), r1=45(y), r2=32(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 45
LDI r2, 32
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
