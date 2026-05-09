; DESCRIPTION: Draws a red rectangle at (112, 209) with width 61 and height 28.
; PLAN: r0=112(x), r1=209(y), r2=61(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 209
LDI r2, 61
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
