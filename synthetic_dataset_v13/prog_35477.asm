; DESCRIPTION: Draws a red rectangle at (52, 33) with width 113 and height 103.
; PLAN: r0=52(x), r1=33(y), r2=113(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 33
LDI r2, 113
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
