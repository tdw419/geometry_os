; DESCRIPTION: Draws a red rectangle at (434, 199) with width 56 and height 40.
; PLAN: r0=434(x), r1=199(y), r2=56(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 199
LDI r2, 56
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
