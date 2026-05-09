; DESCRIPTION: Draws a red rectangle at (312, 131) with width 42 and height 83.
; PLAN: r0=312(x), r1=131(y), r2=42(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 131
LDI r2, 42
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
