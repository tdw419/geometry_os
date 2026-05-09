; DESCRIPTION: Draws a white rectangle at (64, 50) with width 36 and height 87.
; PLAN: r0=64(x), r1=50(y), r2=36(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 50
LDI r2, 36
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
