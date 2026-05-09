; DESCRIPTION: Draws a red rectangle at (233, 173) with width 48 and height 10.
; PLAN: r0=233(x), r1=173(y), r2=48(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 173
LDI r2, 48
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
