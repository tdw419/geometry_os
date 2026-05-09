; DESCRIPTION: Draws a red rectangle at (198, 32) with width 56 and height 93.
; PLAN: r0=198(x), r1=32(y), r2=56(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 32
LDI r2, 56
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
