; DESCRIPTION: Draws a orange rectangle at (245, 124) with width 64 and height 81.
; PLAN: r0=245(x), r1=124(y), r2=64(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 124
LDI r2, 64
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
