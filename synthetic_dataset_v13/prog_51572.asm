; DESCRIPTION: Draws a red rectangle at (440, 45) with width 64 and height 73.
; PLAN: r0=440(x), r1=45(y), r2=64(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 45
LDI r2, 64
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
