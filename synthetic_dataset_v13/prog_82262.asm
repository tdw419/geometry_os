; DESCRIPTION: Draws a red rectangle at (234, 144) with width 32 and height 80.
; PLAN: r0=234(x), r1=144(y), r2=32(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 144
LDI r2, 32
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
