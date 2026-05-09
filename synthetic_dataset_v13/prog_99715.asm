; DESCRIPTION: Draws a yellow rectangle at (346, 42) with width 32 and height 104.
; PLAN: r0=346(x), r1=42(y), r2=32(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 42
LDI r2, 32
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
