; DESCRIPTION: Draws a red rectangle at (154, 32) with width 39 and height 84.
; PLAN: r0=154(x), r1=32(y), r2=39(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 32
LDI r2, 39
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
