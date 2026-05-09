; DESCRIPTION: Draws a red rectangle at (28, 180) with width 23 and height 32.
; PLAN: r0=28(x), r1=180(y), r2=23(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 180
LDI r2, 23
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
