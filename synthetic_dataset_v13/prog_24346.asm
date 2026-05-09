; DESCRIPTION: Draws a red rectangle at (388, 196) with width 29 and height 24.
; PLAN: r0=388(x), r1=196(y), r2=29(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 196
LDI r2, 29
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
