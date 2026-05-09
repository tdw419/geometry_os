; DESCRIPTION: Draws a orange rectangle at (48, 92) with width 32 and height 39.
; PLAN: r0=48(x), r1=92(y), r2=32(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 92
LDI r2, 32
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
