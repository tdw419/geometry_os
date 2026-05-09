; DESCRIPTION: Draws a orange rectangle at (117, 74) with width 32 and height 20.
; PLAN: r0=117(x), r1=74(y), r2=32(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 74
LDI r2, 32
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
