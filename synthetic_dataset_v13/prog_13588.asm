; DESCRIPTION: Draws a red rectangle at (256, 45) with width 54 and height 42.
; PLAN: r0=256(x), r1=45(y), r2=54(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 45
LDI r2, 54
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
