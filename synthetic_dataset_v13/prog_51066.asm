; DESCRIPTION: Draws a orange rectangle at (275, 92) with width 11 and height 32.
; PLAN: r0=275(x), r1=92(y), r2=11(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 92
LDI r2, 11
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
