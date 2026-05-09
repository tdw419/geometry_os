; DESCRIPTION: Draws a orange rectangle at (173, 16) with width 86 and height 39.
; PLAN: r0=173(x), r1=16(y), r2=86(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 16
LDI r2, 86
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
