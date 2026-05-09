; DESCRIPTION: Draws a orange rectangle at (175, 32) with width 64 and height 72.
; PLAN: r0=175(x), r1=32(y), r2=64(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 32
LDI r2, 64
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
