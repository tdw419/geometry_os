; DESCRIPTION: Draws a red rectangle at (92, 60) with width 10 and height 100.
; PLAN: r0=92(x), r1=60(y), r2=10(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 60
LDI r2, 10
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
