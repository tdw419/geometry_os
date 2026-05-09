; DESCRIPTION: Draws a red rectangle at (253, 45) with width 32 and height 24.
; PLAN: r0=253(x), r1=45(y), r2=32(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 45
LDI r2, 32
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
