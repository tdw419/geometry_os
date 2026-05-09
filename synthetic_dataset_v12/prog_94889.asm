; DESCRIPTION: Draws a red rectangle at (173, 12) with width 87 and height 112.
; PLAN: r0=173(x), r1=12(y), r2=87(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 12
LDI r2, 87
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
