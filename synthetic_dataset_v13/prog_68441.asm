; DESCRIPTION: Draws a red rectangle at (73, 173) with width 21 and height 75.
; PLAN: r0=73(x), r1=173(y), r2=21(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 173
LDI r2, 21
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
