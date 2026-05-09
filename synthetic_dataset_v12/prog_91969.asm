; DESCRIPTION: Draws a orange rectangle at (252, 196) with width 98 and height 32.
; PLAN: r0=252(x), r1=196(y), r2=98(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 196
LDI r2, 98
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
