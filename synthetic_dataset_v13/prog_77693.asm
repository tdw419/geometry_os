; DESCRIPTION: Draws a red rectangle at (264, 125) with width 50 and height 30.
; PLAN: r0=264(x), r1=125(y), r2=50(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 125
LDI r2, 50
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
