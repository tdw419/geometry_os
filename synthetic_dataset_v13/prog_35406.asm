; DESCRIPTION: Draws a orange rectangle at (312, 221) with width 92 and height 32.
; PLAN: r0=312(x), r1=221(y), r2=92(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 221
LDI r2, 92
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
