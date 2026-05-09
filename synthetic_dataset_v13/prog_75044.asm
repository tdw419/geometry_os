; DESCRIPTION: Draws a red rectangle at (7, 16) with width 19 and height 32.
; PLAN: r0=7(x), r1=16(y), r2=19(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 16
LDI r2, 19
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
