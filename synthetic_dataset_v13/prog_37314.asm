; DESCRIPTION: Draws a red rectangle at (408, 16) with width 83 and height 96.
; PLAN: r0=408(x), r1=16(y), r2=83(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 16
LDI r2, 83
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
