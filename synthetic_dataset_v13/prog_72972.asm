; DESCRIPTION: Draws a orange rectangle at (175, 131) with width 57 and height 16.
; PLAN: r0=175(x), r1=131(y), r2=57(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 131
LDI r2, 57
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
