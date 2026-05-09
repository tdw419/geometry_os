; DESCRIPTION: Draws a red rectangle at (39, 167) with width 48 and height 10.
; PLAN: r0=39(x), r1=167(y), r2=48(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 167
LDI r2, 48
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
