; DESCRIPTION: Draws a red rectangle at (168, 48) with width 100 and height 74.
; PLAN: r0=168(x), r1=48(y), r2=100(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 48
LDI r2, 100
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
