; DESCRIPTION: Draws a white rectangle at (327, 45) with width 68 and height 64.
; PLAN: r0=327(x), r1=45(y), r2=68(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 45
LDI r2, 68
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
