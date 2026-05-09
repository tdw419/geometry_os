; DESCRIPTION: Draws a orange rectangle at (249, 121) with width 64 and height 31.
; PLAN: r0=249(x), r1=121(y), r2=64(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 121
LDI r2, 64
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
