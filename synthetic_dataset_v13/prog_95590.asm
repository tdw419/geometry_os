; DESCRIPTION: Draws a red rectangle at (249, 32) with width 104 and height 96.
; PLAN: r0=249(x), r1=32(y), r2=104(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 32
LDI r2, 104
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
