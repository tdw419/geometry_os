; DESCRIPTION: Draws a red rectangle at (327, 2) with width 54 and height 48.
; PLAN: r0=327(x), r1=2(y), r2=54(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 2
LDI r2, 54
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
