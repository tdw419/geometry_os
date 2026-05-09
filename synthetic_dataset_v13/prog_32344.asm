; DESCRIPTION: Draws a red rectangle at (66, 50) with width 113 and height 31.
; PLAN: r0=66(x), r1=50(y), r2=113(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 50
LDI r2, 113
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
