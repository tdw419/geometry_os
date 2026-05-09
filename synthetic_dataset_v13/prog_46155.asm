; DESCRIPTION: Draws a white rectangle at (380, 22) with width 42 and height 45.
; PLAN: r0=380(x), r1=22(y), r2=42(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 22
LDI r2, 42
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
